# Terrava — Future Features (Not MVP)

Plan architecture hooks; **do not implement** until after MVP milestones M0–M13 are done and approved.

| Feature | Approach later | MVP hook |
|---------|----------------|----------|
| AI Neighborhood Summary | LLM behind `NeighborhoodSummaryPort`, fed only computed facts | Template summary + port |
| AI Relocation Assistant | Chat UI + Edge Function | None (route placeholder optional) |
| AI Trip Planner | LLM + Directions optimization | Directions M8 only |
| Neighborhood Score (richer) | Tune weights; add datasets | Logic engine M11 |
| Cost of Living (full) | Partner indices / CPI datasets | FX + price_level proxy |
| Safety Score | Official crime / open data only | Explicitly omitted; no fake score |
| Traffic Score | Sampled Directions / roads API | Duration-in-traffic on routes |
| Property Listings | `properties` table + partners | Stub table optional |
| Business Claim | `businesses` + verification | Stub table optional |
| Events | `events` + feeds | Stub table optional |
| Community Questions | `community_questions` | Schema only |
| Offline Maps | Tile packs / Map SDK offline | Detail cache M12 only |
| Public Transport deep | Transit APIs / GTFS | transit_station counts |
| Emergency Services | Filtered Places + dialer | Hospital/pharmacy categories |
| Premium / Subscriptions | `subscriptions` + RevenueCat/Stripe | Schema ready only |
| Voice Search | `speech_to_text` | UI stub M4 |
| Apple Sign-In | Enable entitlements | Architecture M2 |
| Push notifications | FCM / APNs | Pref flags M10 |

## Sequencing suggestion (post-MVP)

1. Tune scoring weights from real usage  
2. Voice search enablement  
3. AI summary feature-flagged  
4. Transport / offline depth  
5. Listings / events / business claim  
6. Subscriptions  

Each becomes its own milestone doc when prioritized.
