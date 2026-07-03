-- Migration 062: Review helpful votes

create table if not exists public.review_votes (
  id        uuid default uuid_generate_v4() primary key,
  review_id uuid references public.reviews(id) on delete cascade not null,
  voter_id  uuid references auth.users(id) on delete cascade not null,
  created_at timestamptz default now() not null,
  unique(review_id, voter_id)
);

create index if not exists review_votes_review_id_idx on public.review_votes(review_id);
create index if not exists review_votes_voter_id_idx  on public.review_votes(voter_id);

alter table public.review_votes enable row level security;

-- Anyone can read vote counts (needed for helpful count display)
create policy "Public can view review votes"
  on public.review_votes for select
  using (true);

-- Authenticated users can vote
create policy "Authenticated users can vote"
  on public.review_votes for insert
  to authenticated
  with check (auth.uid() = voter_id);

-- Users can remove their own vote
create policy "Users can remove own vote"
  on public.review_votes for delete
  to authenticated
  using (auth.uid() = voter_id);
