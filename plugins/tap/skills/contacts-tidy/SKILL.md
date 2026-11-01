---
name: contacts-tidy
description: Tidy up a TAP contact list - find duplicates, wrong or stale routes, and missing detail. Use when the artist wants their contacts cleaned up, deduplicated or checked.
---

# Contacts tidy

## Workflow

1. **List and search.** `tap_list_contacts` for the full list, `tap_search_contacts` and
   `tap_find_people` to check whether a contact you are about to touch already exists under a
   different spelling or outlet name.

2. **Spot duplicates and problems.** Flag likely duplicates (same person or outlet, different
   email or name spelling), contacts with no email or a route that is obviously wrong (a generic
   outlet inbox used as a named contact's address, a dead domain), and contacts with no genre,
   region or outlet type recorded.

3. **Check before merging.** `tap_contact_insights` on each candidate before suggesting a merge -
   a shared name is not proof of the same contact. Present the artist with the proposed merge or
   fix rather than silently collapsing records.

4. **Fix.** `tap_update_contact` to correct a route, name or detail once confirmed. `tap_create_contact`
   / `tap_add_people` only for genuinely new contacts, never as a workaround for an uncertain merge.
   `tap_batch_validate` to check a batch of contacts in one pass before a bulk fix.

5. **Report the cleanup.** List what changed (merged, corrected, flagged-but-left-alone) and what
   still needs the artist's judgement - a tidy that silently removes relationship history is not
   a safe default.

## Boundaries

- Use only real TAP tool names: `tap_list_contacts`, `tap_search_contacts`, `tap_find_people`,
  `tap_contact_insights`, `tap_update_contact`, `tap_create_contact`, `tap_add_people`,
  `tap_batch_validate`, `tap_batch_import`. Do not invent a tool.
- Never delete relationship or correspondence history to make a list look cleaner. When unsure
  whether two records are the same contact, ask rather than merge.
