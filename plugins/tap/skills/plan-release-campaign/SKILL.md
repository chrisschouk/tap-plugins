---
name: plan-release-campaign
description: Plan a release campaign in TAP - create or find the campaign, build a contact pool, and draft pitches ready for the artist to review. Use when the artist wants to start planning a release, a single, an EP or an album.
---

# Plan a release campaign

This skill prepares a campaign in the artist's connected TAP workspace: the campaign, the contact
pool and the pitch drafts. Review and approve your pitches in TAP; TAP sends what you approve.

## Workflow

1. **Find out what you are planning for.** Ask for the artist name and the release (title, type -
   single, EP or album - and release date if known). Use `tap_list_artists` and
   `tap_list_campaigns` to check whether the artist and campaign already exist before creating
   duplicates.

2. **Create or open the campaign.**
   - New release: `tap_create_campaign`.
   - Existing release: `tap_get_campaign` to pull the current state (release date, status, goal)
     before changing anything.
   - Use `tap_workspace_overview` at the start of a session to see what is already in motion and
     what is waiting for the artist's approval.

3. **Build the contact pool.**
   - `tap_find_people` and `tap_search_contacts` to locate candidates by genre, region or outlet
     type.
   - `tap_suggest_contacts` for a shortlist against this specific campaign.
   - `tap_contact_insights` before proposing anyone, so the pitch reflects what TAP already knows
     about that contact.
   - `tap_add_people` / `tap_create_contact` to add new contacts, then `tap_add_contact_to_campaign`
     to attach them to this campaign.
   - Only propose contacts with a documented, checked relationship. Research or shared-pool
     contacts without receipts do not go forward silently - say so and let the artist decide.

4. **Draft pitches, do not send them.**
   - `tap_draft_pitch` for a single contact, `tap_batch_draft_pitches` for several at once.
   - Follow the voice rules in the `draft-and-refine-pitches` skill: specific, no hype, UK
     spelling, facts cited or cut.
   - `tap_queue_pitch_review` to put a draft in front of the artist, or `tap_request_approval` /
     `tap_propose_send` where the workflow calls for an explicit approval step. These queue and
     propose; they do not release anything.

5. **Hand over to the artist.** Summarise what was created: campaign, contacts added, drafts
   queued. The artist reviews the pitches and approves them in TAP.

## Boundaries

- Do not call `start_press_play` or any tool that releases a queued item - that step is the
  artist's, in TAP.
- If a tool call is refused or a capability is missing, say so plainly. Do not route around a
  refusal with a different tool, a guess, or an invented fact.
- Use only the tool names above - they are the live TAP MCP tool set. Do not invent a tool.
