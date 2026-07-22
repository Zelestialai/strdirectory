import { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Privacy Policy | STRVend',
  description: 'How STRVend collects, uses, and protects your personal information.',
}

export default function PrivacyPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 py-16">
      <h1 className="text-3xl font-bold text-gray-900 mb-1">Privacy Policy</h1>
      <p className="text-sm text-gray-500 mb-10">Effective Date: July 20, 2026</p>

      <Section title="1. Introduction">
        <p>STRVend ("we," "us," or "our") operates strvend.com, a marketplace connecting short-term rental hosts with service vendors. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website or use our services.</p>
        <p className="mt-3">By using STRVend, you agree to the collection and use of information in accordance with this policy.</p>
      </Section>

      <Section title="2. Information We Collect">
        <p className="mb-2">We collect information you provide directly:</p>
        <ul className="list-disc pl-5 space-y-1 text-gray-700">
          <li>Account information: name, email address, password (hashed), and account type.</li>
          <li>Business profile: company name, description, category, service markets, website, phone, logo, and gallery images.</li>
          <li>Booking data: guest names, email addresses, check-in/check-out dates, and payment references.</li>
          <li>Communications: messages sent through the platform inbox or team messaging.</li>
          <li>Reviews: ratings and written reviews you submit.</li>
        </ul>
        <p className="mt-3 mb-2">We also collect information automatically:</p>
        <ul className="list-disc pl-5 space-y-1 text-gray-700">
          <li>Usage data: pages visited, features used, vendor profile views.</li>
          <li>Device data: IP address, browser type, operating system, and referring URLs.</li>
          <li>Cookies and similar tracking technologies (see Section 6).</li>
        </ul>
      </Section>

      <Section title="3. How We Use Your Information">
        <ul className="list-disc pl-5 space-y-1 text-gray-700">
          <li>Provide, operate, and improve the STRVend platform.</li>
          <li>Process bookings and payments through Stripe.</li>
          <li>Send transactional emails via Resend (booking confirmations, inquiry notifications, weekly digests).</li>
          <li>Display vendor profiles and enable host discovery.</li>
          <li>Enforce our Terms of Service and Vendor Agreement.</li>
          <li>Detect and prevent fraud or abuse.</li>
          <li>Respond to your requests and support inquiries.</li>
          <li>Analyze usage trends to improve the platform.</li>
        </ul>
      </Section>

      <Section title="4. Sharing Your Information">
        <p className="mb-3">We do not sell your personal data. We may share your information with:</p>
        <dl className="space-y-3">
          <Term term="Supabase">Our database and authentication provider. See <A href="https://supabase.com/privacy">supabase.com/privacy</A>.</Term>
          <Term term="Stripe">Payment processing for subscriptions and bookings. See <A href="https://stripe.com/privacy">stripe.com/privacy</A>.</Term>
          <Term term="Resend">Transactional email delivery. See <A href="https://resend.com/legal/privacy-policy">resend.com/legal/privacy-policy</A>.</Term>
          <Term term="Law enforcement">We may disclose data if required by law, court order, or to protect rights, property, or safety.</Term>
        </dl>
      </Section>

      <Section title="5. Data Retention">
        <p>We retain your account data for as long as your account is active. If you delete your account, we will delete your personal data within 30 days, except where retention is required by law. Financial records may be retained for up to 7 years for tax compliance. Booking records may be retained for up to 5 years for dispute resolution.</p>
      </Section>

      <Section title="6. Cookies">
        <p>We use authentication cookies (Supabase session tokens) that are strictly necessary for the platform to function, and Stripe cookies during payment flows. See our full <a href="/cookie-policy" className="text-teal-600 hover:underline">Cookie Policy</a> for details.</p>
      </Section>

      <Section title="7. Your Rights">
        <p className="mb-2">Depending on your location, you may have the following rights:</p>
        <ul className="list-disc pl-5 space-y-1 text-gray-700">
          <li><strong>Access:</strong> request a copy of the personal data we hold about you.</li>
          <li><strong>Correction:</strong> request that we correct inaccurate data.</li>
          <li><strong>Deletion:</strong> request that we delete your personal data.</li>
          <li><strong>Portability:</strong> request your data in a machine-readable format.</li>
          <li><strong>Objection:</strong> object to certain types of processing.</li>
          <li><strong>CCPA (California residents):</strong> the right to know, delete, and opt out of sale (we do not sell data).</li>
        </ul>
        <p className="mt-3">To exercise any of these rights, contact us at <a href="mailto:legal@strvend.com" className="text-teal-600 hover:underline">legal@strvend.com</a>.</p>
      </Section>

      <Section title="8. Security">
        <p>We implement industry-standard security measures including TLS encryption in transit, bcrypt-hashed passwords, and row-level security policies in our database. However, no method of transmission over the internet is 100% secure.</p>
      </Section>

      <Section title="9. Children's Privacy">
        <p>STRVend is not directed to individuals under 18. We do not knowingly collect personal information from minors. If you believe a minor has provided us personal data, please contact us immediately.</p>
      </Section>

      <Section title="10. Changes to This Policy">
        <p>We may update this Privacy Policy from time to time. We will notify you of material changes by posting the new policy on this page and updating the effective date. Continued use of STRVend after changes constitutes acceptance.</p>
      </Section>

      <Section title="11. Contact Us">
        <p>For privacy questions or to exercise your rights, contact us at <a href="mailto:legal@strvend.com" className="text-teal-600 hover:underline">legal@strvend.com</a>.</p>
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

function Term({ term, children }: { term: string; children: React.ReactNode }) {
  return (
    <div>
      <dt className="font-semibold text-gray-900 inline">{term}: </dt>
      <dd className="inline text-gray-700">{children}</dd>
    </div>
  )
}

function A({ href, children }: { href: string; children: React.ReactNode }) {
  return <a href={href} target="_blank" rel="noopener noreferrer" className="text-teal-600 hover:underline">{children}</a>
}
