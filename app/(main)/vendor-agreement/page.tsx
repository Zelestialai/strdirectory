import { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Vendor Agreement | STRVend',
  description: 'Terms vendors agree to when listing their services on STRVend.',
}

export default function VendorAgreementPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 py-16">
      <h1 className="text-3xl font-bold text-gray-900 mb-1">Vendor Agreement</h1>
      <p className="text-sm text-gray-500 mb-10">Effective Date: July 20, 2026</p>

      <Section title="1. Acceptance">
        <p>This Vendor Agreement ("Agreement") is entered into between you ("Vendor") and STRVend ("Company," "we," "us") when you register a vendor account on strvend.com. By completing registration, you agree to be bound by this Agreement, the STRVend <a href="/terms" className="text-teal-600 hover:underline">Terms of Service</a>, and our <a href="/privacy" className="text-teal-600 hover:underline">Privacy Policy</a>.</p>
        <p className="mt-3">If you are registering on behalf of a business, you represent that you have authority to bind that business to this Agreement.</p>
      </Section>

      <Section title="2. Eligibility">
        <p className="mb-2">To list on STRVend, you must:</p>
        <ul className="list-disc pl-5 space-y-1 text-gray-700">
          <li>Be at least 18 years of age.</li>
          <li>Operate a legitimate business providing services to short-term rental hosts.</li>
          <li>Hold all required licenses, permits, and insurance for your services and jurisdiction.</li>
          <li>Provide accurate and truthful information in your listing.</li>
        </ul>
        <p className="mt-3">STRVend reserves the right to require verification of any of the above at any time.</p>
      </Section>

      <Section title="3. Listing Standards">
        <p className="mb-2">All vendor profiles and listing content must:</p>
        <ul className="list-disc pl-5 space-y-1 text-gray-700">
          <li>Accurately represent your business, services offered, and service areas.</li>
          <li>Use professional, non-misleading language.</li>
          <li>Not contain pricing materially different from prices quoted to hosts.</li>
          <li>Include only images you own or have rights to use.</li>
          <li>Not reference competitors in a disparaging manner.</li>
        </ul>
        <p className="mt-3">STRVend may edit or remove listings that violate these standards without notice.</p>
      </Section>

      <Section title="4. Prohibited Conduct">
        <p className="mb-2">Vendors are strictly prohibited from:</p>
        <ul className="list-disc pl-5 space-y-1 text-gray-700">
          <li>Posting false, misleading, or fraudulent information.</li>
          <li>Soliciting hosts to transact outside STRVend to circumvent fees.</li>
          <li>Harassing, threatening, or discriminating against hosts or other users.</li>
          <li>Creating multiple accounts to manipulate reviews or search rankings.</li>
          <li>Submitting or soliciting fake reviews.</li>
          <li>Violating any applicable laws, including anti-spam, consumer protection, or data privacy laws.</li>
        </ul>
        <p className="mt-3 font-medium text-gray-800">Violation of any prohibition may result in immediate account termination without refund.</p>
      </Section>

      <Section title="5. Subscription Plans and Fees">
        <p className="mb-4">STRVend offers tiered subscription plans (Free, Pro, and Elite) that determine listing visibility, photo limits, and access to premium features.</p>
        <div className="space-y-3">
          <FeeItem label="Billing">Subscriptions are billed monthly or annually via Stripe. By subscribing, you authorize STRVend to charge your payment method on a recurring basis.</FeeItem>
          <FeeItem label="Price changes">We will provide at least 30 days' notice of any subscription price increase. Continued use after the effective date constitutes acceptance.</FeeItem>
          <FeeItem label="Cancellation">You may cancel at any time from your dashboard. Access continues through the end of the paid period. See our <a href="/refund-policy" className="text-teal-600 hover:underline">Refund Policy</a> for refund eligibility.</FeeItem>
          <FeeItem label="Commission">STRVend does not currently charge a commission on vendor-host transactions. This may change with 60 days' prior written notice.</FeeItem>
        </div>
      </Section>

      <Section title="6. Intellectual Property">
        <p>You retain ownership of all content you upload (descriptions, logos, photos). By uploading content, you grant STRVend a non-exclusive, royalty-free, worldwide license to display and promote that content on the platform and in marketing materials.</p>
        <p className="mt-3">You represent that you have the right to grant this license and that your content does not infringe any third-party intellectual property rights.</p>
      </Section>

      <Section title="7. Reviews and Ratings">
        <p>Hosts who have submitted an inquiry or completed a booking may leave a review of your business. STRVend will not remove reviews simply because they are negative, but will remove reviews that violate our content policies (abusive language, false claims, spam).</p>
        <p className="mt-3">Vendors may respond to reviews publicly. Responses must be professional and may not contain personal attacks.</p>
      </Section>

      <Section title="8. Account Suspension and Termination">
        <p className="mb-2">STRVend may suspend or terminate your account at any time for:</p>
        <ul className="list-disc pl-5 space-y-1 text-gray-700">
          <li>Violation of this Agreement or the Terms of Service.</li>
          <li>Consistently poor reviews or host complaints.</li>
          <li>Failure to respond to host inquiries for extended periods.</li>
          <li>Fraudulent activity or misrepresentation.</li>
        </ul>
        <p className="mt-3">Upon termination, your listing will be removed and access to premium features will cease immediately. Prepaid subscription amounts are subject to our <a href="/refund-policy" className="text-teal-600 hover:underline">Refund Policy</a>.</p>
      </Section>

      <Section title="9. Limitation of Liability">
        <p>STRVend is a marketplace platform and is not a party to any transaction between vendors and hosts. We do not guarantee the quality, safety, or legality of vendor services, nor the accuracy of listings.</p>
        <p className="mt-3">To the maximum extent permitted by law, STRVend's total liability to any Vendor shall not exceed the subscription fees paid by that Vendor in the 12 months preceding the claim.</p>
      </Section>

      <Section title="10. Governing Law">
        <p>This Agreement is governed by the laws of the State of Delaware, without regard to conflict of law principles. Any disputes shall be resolved by binding arbitration under JAMS rules, except either party may seek injunctive relief in court.</p>
      </Section>

      <Section title="11. Changes to This Agreement">
        <p>We may update this Agreement from time to time. We will notify you by email and by posting the updated Agreement on this page at least 14 days before changes take effect. Continued use of STRVend after the effective date constitutes acceptance.</p>
      </Section>

      <Section title="12. Contact">
        <p>Questions about this Vendor Agreement? Email us at <a href="mailto:legal@strvend.com" className="text-teal-600 hover:underline">legal@strvend.com</a>.</p>
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

function FeeItem({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="flex gap-3">
      <span className="font-semibold text-gray-900 min-w-[120px] shrink-0">{label}</span>
      <span className="text-gray-700">{children}</span>
    </div>
  )
}
