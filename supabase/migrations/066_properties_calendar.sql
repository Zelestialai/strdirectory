-- Migration 066: Host properties + iCal calendar events

CREATE TABLE IF NOT EXISTS public.properties (
  id              uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  host_id         uuid REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  name            text NOT NULL,
  address         text,
  ical_url        text,
  last_synced_at  timestamptz,
  created_at      timestamptz DEFAULT now(),
  updated_at      timestamptz DEFAULT now()
);

ALTER TABLE public.properties ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Hosts manage their own properties"
  ON public.properties FOR ALL
  USING (host_id = auth.uid())
  WITH CHECK (host_id = auth.uid());

CREATE TABLE IF NOT EXISTS public.calendar_events (
  id            uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  property_id   uuid REFERENCES public.properties(id) ON DELETE CASCADE NOT NULL,
  host_id       uuid REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  event_uid     text NOT NULL,
  summary       text,
  description   text,
  start_date    date NOT NULL,
  end_date      date NOT NULL,
  created_at    timestamptz DEFAULT now(),
  UNIQUE(property_id, event_uid)
);

ALTER TABLE public.calendar_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Hosts manage their own calendar events"
  ON public.calendar_events FOR ALL
  USING (host_id = auth.uid())
  WITH CHECK (host_id = auth.uid());

CREATE INDEX IF NOT EXISTS properties_host_id_idx ON public.properties(host_id);
CREATE INDEX IF NOT EXISTS calendar_events_property_id_idx ON public.calendar_events(property_id);
CREATE INDEX IF NOT EXISTS calendar_events_host_id_idx ON public.calendar_events(host_id);
CREATE INDEX IF NOT EXISTS calendar_events_start_date_idx ON public.calendar_events(start_date);

CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS set_properties_updated_at ON public.properties;
CREATE TRIGGER set_properties_updated_at
  BEFORE UPDATE ON public.properties
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
