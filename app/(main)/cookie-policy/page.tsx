import { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Cookie Policy | STRVend',
  description: 'How STRVend uses cookies and how you can manage them.',
}

export default function CookiePolicyPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 py-16">
      <h1 className="text-3xl font-bold text-gray-900 mb-1">Cookie Policy</h1>
      <p className="text-sm text-gray-500 mb-10">Effective Date: July 20, 2026</p>

      <Section title="1. What Are Cookies?">
        <p>Cookies are small text files placed on your device when you visit a website. They are widely used to make websites work efficiently and to provide information to the website owner. Some cookies are essential for the site to function; others help us understand how visitors use the site.</p>
      </Section>

      <Section title="2. Cookies We Use">
        <p className="mb-6">STRVend uses the following categories of cookies:</p>

        <CookieTable
          category="Strictly Necessary"
          description="Required for the platform to function. These cannot be disabled."
          badge="always active"
          badgeColor="green"
          cookies={[
            { name: 'sb-access-token', purpose: 'Supabase authentication — maintains your login session.', expiry: 'Session / token lifetime' },
            { name: 'sb-refresh-token', purpose: 'Supabase auth — used to refresh your access token silently.', expiry: 'Up to 7 days' },
            { name: 'sb-auth-token', purpose: 'Tracks authentication state client-side.', expiry: 'Session' },
          ]}
        />

        <CookieTable
          category="Functional"
          description="Enable enhanced functionality and personalization."
          badge="functional"
          badgeColor="blue"
          cookies={[
            { name: '__Host-next-auth.csrf-token', purpose: 'CSRF protection — prevents cross-site request forgery.', expiry: 'Session' },
          ]}
        />

        <CookieTable
          category="Payment (Stripe)"
          description="Set by Stripe during payment and Stripe Connect flows. Governed by Stripe's Cookie Policy."
          badge="third-party"
          badgeColor="amber"
          cookies={[
            { name: '__stripe_mid', purpose: 'Stripe machine identifier for fraud prevention.', expiry: '1 year' },
            { name: '__stripe_sid', purpose: 'Stripe session identifier.', expiry: '30 minutes' },
          ]}
        />

        <div className="mt-6 p-4 bg-gray-50 rounded-xl border border-gray-200 text-sm text-gray-600">
          <strong>Analytics:</strong> STRVend currently tracks vendor profile view counts via server-side logging only. We do not use third-party analytics cookies (such as Google Analytics). If we add analytics tools in the future, we will update this policy and obtain appropriate consent.
        </div>
      </Section>

      <Section title="3. How to Control Cookies">
        <div className="space-y-4">
          <div>
            <p className="font-semibold text-gray-900 mb-1">Browser settings</p>
            <p>Most browsers let you refuse or delete cookies. Visit your browser's help pages for instructions. Disabling strictly necessary cookies will prevent you from logging in to STRVend.</p>
          </div>
          <div>
            <p className="font-semibold text-gray-900 mb-1">Stripe</p>
            <p>Manage Stripe cookie preferences at <a href="https://stripe.com/cookie-settings" target="_blank" rel="noopener noreferrer" className="text-teal-600 hover:underline">stripe.com/cookie-settings</a>.</p>
          </div>
        </div>
      </Section>

      <Section title="4. Updates to This Policy">
        <p>We may update this Cookie Policy when we change our use of cookies. The effective date at the top of this page reflects the date of the most recent update.</p>
      </Section>

      <Section title="5. Contact">
        <p>Questions about cookies? Email us at <a href="mailto:legal@strvend.com" className="text-teal-600 hover:underline">legal@strvend.com</a>.</p>
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

type BadgeColor = 'green' | 'blue' | 'amber'

function CookieTable({ category, description, badge, badgeColor, cookies }: {
  category: string
  description: string
  badge: string
  badgeColor: BadgeColor
  cookies: { name: string; purpose: string; expiry: string }[]
}) {
  const badgeStyles: Record<BadgeColor, string> = {
    green: 'bg-green-100 text-green-800',
    blue: 'bg-blue-100 text-blue-800',
    amber: 'bg-amber-100 text-amber-800',
  }
  return (
    <div className="mb-6">
      <div className="flex items-center gap-2 mb-1">
        <h3 className="font-semibold text-gray-900">{category}</h3>
        <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${badgeStyles[badgeColor]}`}>{badge}</span>
      </div>
      <p className="text-sm text-gray-500 mb-3">{description}</p>
      <div className="overflow-hidden rounded-xl border border-gray-200">
        <table className="w-full text-sm">
          <thead className="bg-gray-50 border-b border-gray-200">
            <tr>
              <th className="text-left px-4 py-2.5 text-xs font-semibold text-gray-500 uppercase">Cookie name</th>
              <th className="text-left px-4 py-2.5 text-xs font-semibold text-gray-500 uppercase">Purpose</th>
              <th className="text-left px-4 py-2.5 text-xs font-semibold text-gray-500 uppercase">Expiry</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-100">
            {cookies.map((c) => (
              <tr key={c.name} className="hover:bg-gray-50">
                <td className="px-4 py-3 font-mono text-xs text-gray-800 whitespace-nowrap">{c.name}</td>
                <td className="px-4 py-3 text-gray-600">{c.purpose}</td>
                <td className="px-4 py-3 text-gray-500 whitespace-nowrap">{c.expiry}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}
