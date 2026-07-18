# Terrava — Database (Supabase / PostgreSQL / PostGIS)

## Goals

- Scalable user data for saved places, locations, history
- RLS on every user-owned table
- PostGIS ready for future server-side geo queries
- Schema hooks for businesses, properties, events, premium (unused in MVP)

---

## Extensions

```sql
create extension if not exists "pgcrypto";
create extension if not exists "postgis";
```

---

## Tables (MVP)

### profiles

| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | = `auth.users.id` |
| display_name | text | |
| avatar_url | text | |
| locale | text | default `en` |
| units | text | `metric` \| `imperial` |
| theme_mode | text | `system` \| `light` \| `dark` |
| notification_prefs | jsonb | default `{}` |
| created_at | timestamptz | |
| updated_at | timestamptz | |

Trigger: on `auth.users` insert → create profile.

RLS: select/update own row only.

---

### saved_places

| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| user_id | uuid FK | profiles.id |
| place_id | text | Google place_id |
| name | text | denormalized cache |
| category | text | |
| rating | numeric | nullable |
| address | text | |
| lat | double | |
| lng | double | |
| photo_url | text | |
| metadata | jsonb | |
| created_at | timestamptz | |

Unique `(user_id, place_id)`.

---

### saved_locations

| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| user_id | uuid FK | |
| label | text | e.g. area name |
| formatted_address | text | |
| lat | double | |
| lng | double | |
| geog | geography(Point,4326) | PostGIS |
| place_id | text | nullable |
| photo_url | text | |
| metadata | jsonb | |
| created_at | timestamptz | |

---

### collections

| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| user_id | uuid FK | |
| name | text | |
| description | text | |
| created_at | timestamptz | |
| updated_at | timestamptz | |

### collection_items

| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| collection_id | uuid FK | |
| user_id | uuid FK | denormalized for RLS |
| item_type | text | `place` \| `location` |
| place_id | text | nullable |
| saved_location_id | uuid | nullable |
| created_at | timestamptz | |

---

### recently_viewed

| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| user_id | uuid FK | |
| item_type | text | `place` \| `location` |
| place_id | text | nullable |
| label | text | |
| lat | double | |
| lng | double | |
| photo_url | text | |
| viewed_at | timestamptz | |

Index `(user_id, viewed_at desc)`. Cap client-side (e.g. keep last 50).

---

### search_history

| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| user_id | uuid FK | |
| query | text | |
| lat | double | nullable |
| lng | double | nullable |
| result_place_id | text | nullable |
| created_at | timestamptz | |

---

### reviews (Terrava-native — schema early, UI later optional)

| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| user_id | uuid FK | |
| place_id | text | |
| rating | int | 1–5 |
| body | text | |
| created_at | timestamptz | |

MVP may show Google reviews only; table reserved.

---

### neighborhood_score_cache (optional, M11)

| Column | Type | Notes |
|--------|------|-------|
| geohash | text PK | |
| payload | jsonb | scores + facts |
| computed_at | timestamptz | |
| expires_at | timestamptz | |

Can also be local-only cache; server cache is optional.

---

## Future-ready (create empty or stub, no UI)

Do **not** build product UI in MVP. Tables may be created as empty stubs with RLS denying public writes:

- `businesses`
- `properties`
- `events`
- `subscriptions` / `entitlements`
- `community_questions`

Document columns in a later migration when prioritized. See [FUTURE_FEATURES.md](./FUTURE_FEATURES.md).

---

## RLS pattern (all user tables)

```sql
alter table <table> enable row level security;

create policy "<table>_select_own"
  on <table> for select
  using (auth.uid() = user_id);

create policy "<table>_insert_own"
  on <table> for insert
  with check (auth.uid() = user_id);

create policy "<table>_update_own"
  on <table> for update
  using (auth.uid() = user_id);

create policy "<table>_delete_own"
  on <table> for delete
  using (auth.uid() = user_id);
```

`profiles` uses `auth.uid() = id`.

---

## Storage

- Bucket: `avatars`
- Path: `{user_id}/avatar.jpg`
- Policy: user can read public avatars; write only own folder

---

## Milestone mapping

| Milestone | DB work |
|-----------|---------|
| M0 | Project + extensions |
| M2 | profiles + trigger + RLS |
| M4 | search_history |
| M6–M7 | saved_locations, saved_places, recently_viewed |
| M9 | collections, collection_items |
| M10 | profile preference columns + avatars |
| M11 | score cache (optional) |
| M13 | RLS audit + indexes |
