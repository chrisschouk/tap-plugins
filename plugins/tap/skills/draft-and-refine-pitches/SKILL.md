---
name: draft-and-refine-pitches
description: Draft and refine pitch emails for a TAP campaign, following TAP's voice rules. Use when the artist wants a pitch written, rewritten, tightened or checked before review.
---

# Draft and refine pitches

## Voice rules

- Specific, not hype. Name the release, the date, the sound, the comparison that actually fits -
  never "exciting new single" or "don't miss this".
- UK spelling throughout (colour, organised, favourite).
- Every factual claim is either verified against TAP's own record for this campaign and contact,
  or left out. Never invent a release date, a biography detail, a support slot, a placement or an
  asset link.
- No lyric excerpts in pitch emails.
- Short. A pitch is an introduction, not the press release.

## Workflow

1. **Ground the draft in real data.** `tap_get_campaign` for the release facts, `tap_contact_insights`
   and `tap_get_campaign_correspondence` for what this contact already knows or has said. Use
   `tap_list_pitch_drafts` to see what already exists for this campaign before writing a duplicate.

2. **Draft.** `tap_draft_pitch` for one contact, `tap_batch_draft_pitches` for several contacts at
   once against the same campaign. Apply the voice rules above to every draft.

3. **Refine.** When the artist asks for a change - shorter, warmer, drop a line, fix a fact - make
   the edit and re-draft with `tap_draft_pitch`. Read back what changed, not the whole email again,
   unless the artist asks to see it in full.

4. **Queue, do not send.** `tap_queue_pitch_review` to put the draft in front of the artist, or
   `tap_request_approval` / `tap_propose_send` where the workflow calls for an explicit approval
   step. Review and approve your pitches in TAP; TAP sends what you approve.

## Boundaries

- Use only real TAP tool names: `tap_draft_pitch`, `tap_batch_draft_pitches`,
  `tap_list_pitch_drafts`, `tap_contact_insights`, `tap_get_campaign_correspondence`,
  `tap_queue_pitch_review`, `tap_request_approval`, `tap_propose_send`, `tap_get_campaign`. Do not
  invent a tool.
- If a fact is missing (no confirmed date, no verified support slot), say so and leave it out of
  the draft rather than guessing.
