-- ============================================================
-- Migration 002 — Expand vendor categories to full STR suite
-- ============================================================

-- Update existing 4 to match new naming conventions
update public.categories set name = 'Cleaning & Turnover',   slug = 'cleaning-turnover'   where slug = 'cleaning-turnover';
update public.categories set name = 'Photography & Design',  slug = 'photography-design'  where slug = 'photography-design';
update public.categories set name = 'Maintenance & Repairs', slug = 'maintenance-repairs' where slug = 'maintenance-repairs';
update public.categories set name = 'Property Management',   slug = 'property-management' where slug = 'property-management';

-- Insert 8 new categories (skip if already present)
insert into public.categories (name, slug, description, icon, color) values
  ('Real Estate & Property Finders',  'real-estate',       'Buyer agents, STR property finders, and acquisition specialists',         'Home',          'blue'),
  ('Interior Design & Staging',       'interior-design',   'Interior designers, STR stagers, and furnishing consultants',              'Palette',       'pink'),
  ('Renovation & Construction',       'renovation',        'General contractors, renovators, and builders specialising in STRs',       'HardHat',       'orange'),
  ('Accounting & Tax',                'accounting-tax',    'STR accountants, tax advisors, and bookkeeping specialists',               'Calculator',    'teal'),
  ('Insurance',                       'insurance',         'Short-term rental insurance brokers and coverage advisors',                'ShieldCheck',   'indigo'),
  ('Furniture & Supplies',            'furniture-supplies','Furniture suppliers, linen providers, and STR supply companies',           'Sofa',          'rose'),
  ('Smart Home & Technology',         'smart-home-tech',   'Smart lock installers, WiFi specialists, and home automation pros',        'Wifi',          'cyan'),
  ('Legal & Regulations',             'legal-regulations', 'STR lawyers, permit consultants, and local regulation experts',            'Scale',         'slate')
on conflict (slug) do nothing;
