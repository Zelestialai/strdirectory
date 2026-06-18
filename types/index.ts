export interface Profile {
  id: string;
  email: string;
  full_name: string | null;
  avatar_url: string | null;
  role: "user" | "admin";
  created_at: string;
}

export interface Category {
  id: string;
  name: string;
  slug: string;
  description: string | null;
  icon: string | null;
  color: string | null;
  created_at: string;
}

export interface Market {
  id: string;
  name: string;
  slug: string;
  state: string;
  cities: string[];
  tagline: string | null;
  description: string | null;
  is_active: boolean;
  created_at: string;
}

export interface Vendor {
  id: string;
  user_id: string;
  category_id: string;
  category?: Category;
  business_name: string;
  slug: string;
  tagline: string | null;
  description: string | null;
  website: string | null;
  phone: string | null;
  email: string | null;
  city: string | null;
  state: string | null;
  zip: string | null;
  country?: string;
  service_area: string | null;
  service_radius: number | null;
  logo_url: string | null;
  cover_url: string | null;
  avg_rating: number;
  review_count: number;
  is_verified: boolean;
  is_featured: boolean;
  is_active: boolean;
  is_claimed: boolean;
  notification_email: string | null;
  created_at: string;
  services?: VendorService[];
}

export interface VendorService {
  id: string;
  vendor_id: string;
  name: string;
  description: string | null;
  price_from: number | null;
  price_to: number | null;
  price_unit: string | null;
}

export interface Review {
  id: string;
  vendor_id: string;
  reviewer_id: string;
  reviewer?: Profile;
  profiles?: Profile;
  rating: number;
  title: string | null;
  body: string | null;
  created_at: string;
}

export interface Inquiry {
  id: string;
  vendor_id: string;
  vendor?: Vendor;
  sender_id: string | null;
  sender_name: string;
  sender_email: string;
  sender_phone: string | null;
  message: string;
  status: "new" | "read" | "replied" | "closed";
  created_at: string;
}

export interface VendorSearchParams {
  q?: string;
  category?: string;
  city?: string;
  state?: string;
  market?: string;
  min_rating?: string;
  page?: string;
}
