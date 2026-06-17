import { type ClassValue, clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

export function formatDate(dateString: string): string {
  return new Date(dateString).toLocaleDateString('en-US', {
    year: 'numeric', month: 'long', day: 'numeric',
  });
}

export function truncate(str: string, maxLen = 120): string {
  if (str.length <= maxLen) return str;
  return str.slice(0, maxLen).trimEnd() + '…';
}

/** Map category slug → Unsplash cover image URL */
export const CATEGORY_COVERS: Record<string, string> = {
  'cleaning-turnover':   'https://images.unsplash.com/photo-1581578731548-c64695cc6952?w=800&h=400&fit=crop&q=80',
  'photography-design':  'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=800&h=400&fit=crop&q=80',
  'maintenance-repairs': 'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=800&h=400&fit=crop&q=80',
  'property-management': 'https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=800&h=400&fit=crop&q=80',
  'real-estate':         'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800&h=400&fit=crop&q=80',
  'interior-design':     'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?w=800&h=400&fit=crop&q=80',
  'renovation':          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800&h=400&fit=crop&q=80',
  'accounting-tax':      'https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=800&h=400&fit=crop&q=80',
  'insurance':           'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&h=400&fit=crop&q=80',
  'furniture-supplies':  'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800&h=400&fit=crop&q=80',
  'smart-home-tech':     'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&h=400&fit=crop&q=80',
  'legal-regulations':   'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?w=800&h=400&fit=crop&q=80',
};

/** Map category slug → Tailwind color token */
export const CATEGORY_COLORS: Record<string, string> = {
  'cleaning-turnover':   'sky',
  'photography-design':  'violet',
  'maintenance-repairs': 'amber',
  'property-management': 'emerald',
  'real-estate':         'blue',
  'interior-design':     'pink',
  'renovation':          'orange',
  'accounting-tax':      'teal',
  'insurance':           'indigo',
  'furniture-supplies':  'rose',
  'smart-home-tech':     'cyan',
  'legal-regulations':   'slate',
};

export const COLOR_CLASSES: Record<string, { bg: string; text: string; border: string }> = {
  sky:     { bg: 'bg-sky-50',     text: 'text-sky-700',     border: 'border-sky-200' },
  violet:  { bg: 'bg-violet-50',  text: 'text-violet-700',  border: 'border-violet-200' },
  amber:   { bg: 'bg-amber-50',   text: 'text-amber-700',   border: 'border-amber-200' },
  emerald: { bg: 'bg-emerald-50', text: 'text-emerald-700', border: 'border-emerald-200' },
  blue:    { bg: 'bg-blue-50',    text: 'text-blue-700',    border: 'border-blue-200' },
  pink:    { bg: 'bg-pink-50',    text: 'text-pink-700',    border: 'border-pink-200' },
  orange:  { bg: 'bg-orange-50',  text: 'text-orange-700',  border: 'border-orange-200' },
  teal:    { bg: 'bg-teal-50',    text: 'text-teal-700',    border: 'border-teal-200' },
  indigo:  { bg: 'bg-indigo-50',  text: 'text-indigo-700',  border: 'border-indigo-200' },
  rose:    { bg: 'bg-rose-50',    text: 'text-rose-700',    border: 'border-rose-200' },
  cyan:    { bg: 'bg-cyan-50',    text: 'text-cyan-700',    border: 'border-cyan-200' },
  slate:   { bg: 'bg-slate-50',   text: 'text-slate-700',   border: 'border-slate-200' },
};
