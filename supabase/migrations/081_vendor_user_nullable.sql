-- Migration 081: Allow admin-created (unclaimed) vendor listings.
-- Vendors created by an admin have no owning user until a host claims them,
-- so user_id must be nullable. (The unique(user_id) constraint was already
-- dropped in an earlier migration; NULLs are allowed and non-conflicting.)

ALTER TABLE public.vendors ALTER COLUMN user_id DROP NOT NULL;
