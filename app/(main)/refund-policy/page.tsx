import { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Refund Policy | STRVend',
  description: 'STRVend refund and cancellation policy for vendor subscriptions and direct bookings.',
}

export default function RefundPolicyPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 py-16">
      <h1 className="text-3xl font-bold text-gray-900 mb-1">Refund Policy</h1>
      <p className="text-sm text-gray-500 mb-10">Effective Date: July 20, 2026</p>

      <Section title="1. Overview">
        <p>This Refund Policy applies to all transactions made through STRVend, including vendor subscription plans and direct bookings processed via Stripe. Please read this policy carefully before making a purchase.</p>
      </Section>

      <Section title="2. Vendor Subscription Refunds">
        <p className="mb-4">STRVend offers monthly and annual subscription plans for vendors.</p>
        <div className="space-y-4">
          <PolicyCard label="Monthly subscriptions" color="teal">
            Refunds are available within <strong>7 days</strong> of the initial purchase if no premium features have been meaningfully used. Renewals are non-refundable.
          </PolicyCard>
          <PolicyCard label="Annual subscriptions" color="teal">
            Refunds are available within <strong>14 days</strong> of the initial purchase on a pro-rata basis for unused months. After 14 days, annual subscriptions are non-refundable.
          </PolicyCard>
          <PolicyCard label="Downgrade" color="gray">
            You may downgrade your plan at any time. The lower rate applies at the next billing cycle; no partial refund is issued for the current period.
          </PolicyCard>
          <PolicyCard label="Cancellation" color="gray">
            Cancelling stops future charges but does not trigger a refund for the current billing period. Access continues until the period ends.
          </PolicyCard>
        </div>
      </Section>

      <Section title="3. Direct Booking Refunds">
        <p className="mb-4">Bookings made through a host's direct booking page are subject to the following terms:</p>
        <div className="overflow-hidden rounded-xl border border-gray-200">
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Cancellation timing</th>
                <th className="text-left px-4 py-3 font-semibold text-gray-600">Refund</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              <tr className="hover:bg-gray-50">
                <td className="px-4 py-3 text-gray-700">More than 48 hours before check-in</td>
                <td className="px-4 py-3 text-green-700 font-medium">Full refund (nightly rate + cleaning fee)</td>
              </tr>
              <tr className="hover:bg-gray-50">
                <td className="px-4 py-3 text-gray-700">24–48 hours before check-in</td>
                <td className="px-4 py-3 text-amber-700 font-medium">50% of nightly rate · cleaning fee non-refundable</td>
              </tr>
              <tr className="hover:bg-gray-50">
                <td className="px-4 py-3 text-gray-700">Less than 24 hours before check-in</td>
                <td className="px-4 py-3 text-red-700 font-medium">No refund</td>
              </tr>
              <tr className="hover:bg-gray-50">
                <td className="px-4 py-3 text-gray-700">No-show</td>
                <td className="px-4 py-3 text-red-700 font-medium">No refund</td>
              </tr>
            </tbody>
          </table>
        </div>
        <p className="mt-3 text-sm text-gray-500">Refunds are processed back to the original payment method within 5–10 business days.</p>
      </Section>

      <Section title="4. Non-Refundable Items">
        <ul className="list-disc pl-5 space-y-1 text-gray-700">
          <li>Platform fees or service charges applied by STRVend.</li>
          <li>Stripe payment processing fees (~2.9% + $0.30 per transaction).</li>
          <li>Subscription periods already consumed.</li>
          <li>Bookings cancelled after the applicable window has passed.</li>
        </ul>
      </Section>

      <Section title="5. How to Request a Refund">
        <p>For <strong>subscription refunds</strong>, email <a href="mailto:legal@strvend.com" className="text-teal-600 hover:underline">legal@strvend.com</a> with your account email and reason. We process within 5 business days.</p>
        <p className="mt-3">For <strong>direct booking refunds</strong>, contact the host via STRVend messaging. If the host doesn't respond within 48 hours, escalate to us at the email above with your booking ID.</p>
      </Section>

      <Section title="6. Disputes">
        <p>If you believe a charge is incorrect, contact us within 60 days of the transaction date. We will investigate and respond within 10 business days. Initiating a chargeback before contacting us may result in account suspension pending resolution.</p>
      </Section>

      <Section title="7. Changes to This Policy">
        <p>We may modify this policy at any time. Changes take effect upon posting. The policy in effect at the time of your purchase governs that transaction.</p>
      </Section>

      <Section title="8. Contact">
        <p>Questions? Email us at <a href="mailto:legal@strvend.com" className="text-teal-600 hover:underline">legal@strvend.com</a>.</p>
      </Section>
    </div>
  )
}

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <section className="mb-10">
      <h2 className="text-xl font-semibold text-gray-900 border-b border-teal-200 pb-2 mb-4">{title}</h2>
      <div className="text-gray-700 leading-relaxed text-[15px]">{children}</div>
    </section>
  )
}

function PolicyCard({ label, color, children }: { label: string; color: 'teal' | 'gray'; children: React.ReactNode }) {
  const bg = color === 'teal' ? 'bg-teal-50 border-teal-200' : 'bg-gray-50 border-gray-200'
  const labelColor = color === 'teal' ? 'text-teal-800' : 'text-gray-700'
  return (
    <div className={`rounded-xl border p-4 ${bg}`}>
      <p className={`font-semibold mb-1 ${labelColor}`}>{label}</p>
      <p className="text-gray-700 text-sm">{children}</p>
    </div>
  )
}
