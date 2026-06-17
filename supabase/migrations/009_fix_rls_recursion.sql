-- ============================================================
-- Migration 009 — Fix infinite recursion in profiles RLS
--
-- The admin RLS policies query public.profiles to check role,
-- but profiles itself has RLS, causing infinite recursion.
-- Fix: use a SECURITY DEFINER function that bypasses RLS.
-- ============================================================

-- 1. Create a stable, security-definer function to check admin role
--    (runs as the function owner, bypasses RLS on profiles)
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = auth.uid() AND role = 'admin'
  );
$$;

-- 2. Fix profiles policies — drop any self-referencing ones
DROP POLICY IF EXISTS "Public profiles are viewable by everyone"  ON public.profiles;
DROP POLICY IF EXISTS "Profiles viewable by owner or admin"       ON public.profiles;
DROP POLICY IF EXISTS "Admins can view all profiles"              ON public.profiles;
DROP POLICY IF EXISTS "Users can update own profile"              ON public.profiles;
DROP POLICY IF EXISTS "Admins can update any profile"             ON public.profiles;

-- Recreate cleanly (no self-reference)
CREATE POLICY "Profiles are publicly readable" ON public.profiles
  FOR SELECT USING (true);

CREATE POLICY "Users can update own profile" ON public.profiles
  FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Admins can update any profile" ON public.profiles
  FOR UPDATE USING (public.is_admin());

-- 3. Fix vendor policies that reference profiles directly
DROP POLICY IF EXISTS "Admins can manage all vendors"   ON public.vendors;
DROP POLICY IF EXISTS "Admins can update any vendor"    ON public.vendors;
DROP POLICY IF EXISTS "Admins can delete any vendor"    ON public.vendors;
DROP POLICY IF EXISTS "Admin full access to vendors"    ON public.vendors;

-- Recreate using the safe function
CREATE POLICY "Admins can manage all vendors" ON public.vendors
  FOR ALL USING (public.is_admin());

-- 4. Same fix for any other tables that had admin policies
DROP POLICY IF EXISTS "Admins can manage markets"       ON public.markets;
CREATE POLICY "Admins can manage markets" ON public.markets
  FOR ALL USING (public.is_admin());

DROP POLICY IF EXISTS "Admins can manage categories"    ON public.categories;
CREATE POLICY "Admins can manage categories" ON public.categories
  FOR ALL USING (public.is_admin());
