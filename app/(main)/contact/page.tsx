import type { Metadata } from "next";
import { Mail, MessageSquare, Building2 } from "lucide-react";

export const metadata: Metadata = {
  title: "Contact",
  description: "Get in touch with the STRVend team.",
};

export default function ContactPage() {
  return (
    <div>
      {/* Hero */}
      <section className="bg-brand-700 text-white py-16 text-center">
        <div className="mx-auto max-w-xl px-4 sm:px-6">
          <h1 className="text-4xl font-extrabold tracking-tight mb-4">Get in touch</h1>
          <p className="text-brand-100 text-lg">
            Questions, feedback, or just want to say hello — we&apos;d love to hear from you.
          </p>
        </div>
      </section>

      {/* Contact options */}
      <section className="mx-auto max-w-3xl px-4 py-16 sm:px-6">
        <div className="grid gap-6 sm:grid-cols-3 mb-14">
          {[
            {
              icon: Mail,
              title: "Email us",
              detail: "hello@strvend.com",
              desc: "For general enquiries and feedback.",
              href: "mailto:hello@strvend.com",
            },
            {
              icon: Building2,
              title: "Vendor support",
              detail: "vendors@strvend.com",
              desc: "Listing issues, profile edits, billing.",
              href: "mailto:vendors@strvend.com",
            },
            {
              icon: MessageSquare,
              title: "Partnerships",
              detail: "partners@strvend.com",
              desc: "Integrations, media, and press.",
              href: "mailto:partners@strvend.com",
            },
          ].map(({ icon: Icon, title, detail, desc, href }) => (
            <a
              key={title}
              href={href}
              className="flex flex-col items-center text-center bg-white rounded-2xl border border-gray-100 p-6 hover:border-brand-200 hover:shadow-md transition group"
            >
              <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-brand-50 mb-3 group-hover:bg-brand-100 transition">
                <Icon className="h-5 w-5 text-brand-600" />
              </span>
              <p className="font-semibold text-gray-900 mb-0.5">{title}</p>
              <p className="text-sm text-brand-600 font-medium mb-2">{detail}</p>
              <p className="text-xs text-gray-500">{desc}</p>
            </a>
          ))}
        </div>

        {/* Response note */}
        <div className="rounded-2xl bg-gray-50 border border-gray-100 p-6 text-center">
          <p className="text-sm text-gray-600">
            We typically respond within <span className="font-semibold text-gray-900">1–2 business days</span>.
            For the fastest response, include your email address and a brief description of your question.
          </p>
        </div>
      </section>
    </div>
  );
}
