import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { createClient as createAdminClient } from '@supabase/supabase-js'
import { Resend } from 'resend'

const resend = new Resend(process.env.RESEND_API_KEY)
const baseUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://strvend.com'

function adminSupabase() {
  return createAdminClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  )
}

export async function POST(
  request: NextRequest,
  { params }: { params: { id: string } }
) {
  const supabase = createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const { body } = await request.json()
  if (!body?.trim()) {
    return NextResponse.json({ error: 'Reply body is required' }, { status: 400 })
  }

  // Get vendor for this user
  const { data: vendor } = await supabase
    .from('vendors')
    .select('id, business_name')
    .eq('user_id', user.id)
    .single()

  if (!vendor) return NextResponse.json({ error: 'Vendor not found' }, { status: 404 })

  // Verify inquiry belongs to this vendor
  const { data: inquiry } = await supabase
    .from('inquiries')
    .select('id, sender_name, sender_email, message')
    .eq('id', params.id)
    .eq('vendor_id', vendor.id)
    .single()

  if (!inquiry) return NextResponse.json({ error: 'Inquiry not found' }, { status: 404 })

  const admin = adminSupabase()

  // Insert the reply
  const { data: reply, error: replyError } = await admin
    .from('inquiry_replies')
    .insert({
      inquiry_id: inquiry.id,
      vendor_id: vendor.id,
      body: body.trim(),
    })
    .select()
    .single()

  if (replyError) {
    console.error('Failed to insert reply:', replyError)
    return NextResponse.json({ error: 'Failed to save reply' }, { status: 500 })
  }

  // Mark inquiry as replied
  await admin
    .from('inquiries')
    .update({ status: 'replied' })
    .eq('id', inquiry.id)

  // Email the original sender if we have their email
  if (inquiry.sender_email) {
    await resend.emails.send({
      from: `${vendor.business_name} via STRVend <noreply@strvend.com>`,
      to: inquiry.sender_email,
      replyTo: undefined, // vendor replies in-app
      subject: `Re: Your inquiry to ${vendor.business_name}`,
      html: replyEmail({
        senderName: inquiry.sender_name || 'there',
        businessName: vendor.business_name,
        originalMessage: inquiry.message,
        replyBody: body.trim(),
      }),
    }).catch(console.error)
  }

  return NextResponse.json({ reply })
}

function replyEmail({
  senderName,
  businessName,
  originalMessage,
  replyBody,
}: {
  senderName: string
  businessName: string
  originalMessage: string
  replyBody: string
}) {
  return `
    <div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; background: #f9fafb; padding: 40px 16px;">
      <div style="max-width: 560px; margin: 0 auto; background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.08);">
        <div style="background: #0d9488; padding: 24px 32px;">
          <span style="font-size: 20px; font-weight: 700; color: white; letter-spacing: -0.5px;">
            <span style="color: #99f6e4;">STR</span>Vend
          </span>
        </div>
        <div style="padding: 32px;">
          <p style="margin: 0 0 4px; font-size: 15px; color: #6b7280;">Hi ${senderName},</p>
          <h2 style="margin: 0 0 20px; font-size: 20px; color: #111827;">
            ${businessName} replied to your inquiry
          </h2>

          <div style="background: #f0fdfa; border-left: 3px solid #0d9488; border-radius: 0 8px 8px 0; padding: 16px; margin-bottom: 24px;">
            <p style="margin: 0 0 4px; font-size: 11px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; color: #0f766e;">Reply from ${businessName}</p>
            <p style="margin: 0; font-size: 15px; color: #111827; line-height: 1.6; white-space: pre-wrap;">${replyBody}</p>
          </div>

          <details style="margin-bottom: 24px;">
            <summary style="font-size: 13px; color: #9ca3af; cursor: pointer; user-select: none;">Your original message</summary>
            <div style="margin-top: 8px; background: #f9fafb; border-radius: 8px; padding: 12px; font-size: 13px; color: #6b7280; line-height: 1.5; white-space: pre-wrap;">${originalMessage}</div>
          </details>

          <p style="font-size: 13px; color: #9ca3af; margin: 0;">
            This message was sent through STRVend. To view the full conversation or find more vendors, visit
            <a href="${baseUrl}" style="color: #0d9488;">strvend.com</a>.
          </p>
        </div>
        <div style="padding: 20px 32px; background: #f9fafb; border-top: 1px solid #f3f4f6; font-size: 12px; color: #9ca3af;">
          © ${new Date().getFullYear()} STRVend · <a href="${baseUrl}/privacy" style="color: #9ca3af;">Privacy</a>
        </div>
      </div>
    </div>
  `
}
