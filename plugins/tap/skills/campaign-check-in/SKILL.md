---
name: campaign-check-in
description: Check in on a running TAP campaign - outcomes, replies, what is queued, and what to do next. Use when the artist asks how a campaign is going, what has come back, or what's next.
---

# Campaign check-in

## Workflow

1. **Get the shape of the campaign.** `tap_get_campaign` for status and goal,
   `tap_analyse_campaign` for how it is performing, `tap_workspace_overview` if the artist has not
   named a specific campaign.

2. **Pull outcomes and correspondence.** `tap_get_outcomes` for coverage and replies logged so far,
   `tap_get_campaign_correspondence` for what has actually been said to a given contact. Distinguish
   clearly between a proposed placement and accepted coverage, and between an ambiguous reply and a
   confirmed one - do not round either up.

3. **Check what is in flight.** `tap_get_approval_queue` and `tap_get_approval_status` for what is
   waiting on the artist, `tap_get_outreach_queue` and `tap_list_pending_executions` for what is
   queued to go out, `tap_list_pitch_drafts` for drafts not yet queued.

4. **Suggest next actions.** `tap_suggest_next_actions` for what the campaign needs next;
   `tap_suggest_contacts` if the shortlist is thin. Where logging a lesson matters,
   `tap_campaign_memory` with `action: get` to read what TAP already learned on this campaign, or
   write a new one when the artist shares something worth keeping.

5. **Report plainly.** State what has happened (with the source - a reply, a confirmed play, a
   logged outcome), what is waiting on the artist, and what the next action is. Say when a number
   is an estimate rather than a confirmed figure.

## Boundaries

- Use only real TAP tool names: `tap_get_campaign`, `tap_analyse_campaign`,
  `tap_workspace_overview`, `tap_get_outcomes`, `tap_get_campaign_correspondence`,
  `tap_get_approval_queue`, `tap_get_approval_status`, `tap_get_outreach_queue`,
  `tap_list_pending_executions`, `tap_list_pitch_drafts`, `tap_suggest_next_actions`,
  `tap_suggest_contacts`, `tap_campaign_memory`, `tap_log_outcome`, `tap_update_outcome`. Do not
  invent a tool.
- A reply counter or outcome log can lag real life; if TAP's record and what the artist just told
  you disagree, say so rather than picking one silently.
