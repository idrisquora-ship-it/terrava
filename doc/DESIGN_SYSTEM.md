# Terrava — Design System

## Product UI identity

Feel: **Airbnb × Notion × Apple Maps × Uber** — not Google Maps.

| Trait | Application |
|-------|-------------|
| Minimal | One purpose per screen; no clutter |
| Premium | Large imagery, calm type, generous whitespace |
| Modern | Rounded corners, smooth transitions |
| Global | Works visually for any locale |

## Hard rules (from product brief)

- Every screen: **one purpose**, one headline idea
- Avoid clutter; prioritize readability
- Large touch targets (≥ 44pt)
- Consistent spacing scale
- Modern cards **for interaction**, not decoration
- Beautiful loading skeletons
- Smooth page transitions
- One-handed mobile use
- Light + Dark + System
- Accessibility support

## Visual direction (avoid AI clichés)

Avoid defaulting to:

- Purple-on-white / purple–indigo gradients
- Warm cream + terracotta + generic serif combo as “default luxury”
- Dense broadsheet / newspaper layouts
- Glow spam, emoji rows, pill-cluster chrome

Prefer a clear Terrava palette (define in M1): deep earth/forest or slate + one accent, expressive but restrained typography, soft atmospheric backgrounds (subtle gradient/mesh — not flat gray only).

## Tokens (to define in M1)

```
spacing: 4, 8, 12, 16, 24, 32, 48
radius: 12, 16, 24 (cards/sheets)
elevation: prefer soft borders over heavy shadows
type: display / title / body / label / caption
```

## Motion

- Subtle only (`flutter_animate`)
- Ship 2–3 intentional motions on key flows (splash brand, home section reveal, sheet present)
- No noisy perpetual animation

## Component inventory (shared)

Built across M1–M3:

- Buttons, fields, app bars
- Section headers
- Skeletons
- Empty / error states
- Place cards (horizontal / large)
- Category grid items
- Map controls + preview sheet
- Action bar (save / share / directions)

## Screen composition reminders

### Home
Search + location + categories + discovery sections — still airy; no dashboard soup.

### Location Details
Hero → identity → scores/stats → nearby sections → photos/reviews → actions.

### Place Details
Cover → identity → facts → hours → photos/reviews → actions.

### Map
Custom markers/clustering; Terrava sheets/controls — not Google UI clone.
