# 4. Root cause and gap analysis

## 5 Whys: Video KYC drop-off

1. **Why do 3,176 customers drop at Video KYC?** They miss the call (1,365), leave while waiting (1,143) or the call fails on a weak network (668).
2. **Why do they miss calls or leave while waiting?** Waits are long and unpredictable: 34% of calls wait over 15 minutes, and failure reaches 45.4% above 30 minutes.
3. **Why are waits long?** Demand peaks in the evening and at night (7,979 of 14,577 calls), and night waits average 27.5 minutes vs 5.5 in the morning.
4. **Why is there no slot when the customer is free?** The journey puts every customer into a live queue; there is no option to book a time. *(Assumption to validate with VKYC operations: agent shifts are planned around office hours.)*
5. **Why does a missed call end the journey?** There is no rebooking or save-and-resume, so the customer has to start again.

**Root cause:** Video KYC runs as a first-come live queue that does not match when customers apply, with no booking, reminder or recovery.

## Fishbone summary

| Category | Cause |
| --- | --- |
| Process | Live queue only; no booking or rebooking |
| People | Fewer agents in evening and night slots *(to validate)* |
| Technology | No reminder; no save-and-resume; no low-bandwidth mode |
| Environment | Weaker networks in Tier 3 cities (approval 75.6% vs 79.7% in Tier 1 at the same ~14 min wait) |

## Gap analysis

| Area | AS-IS | TO-BE | Gap | Proposed fix |
| --- | --- | --- | --- | --- |
| VKYC wait | 34% of calls wait over 15 min; night average 27.5 min | Under 15% of calls wait over 15 min | No scheduling | VKYC slot booking |
| Missed calls | 1,365 customers lost to missed calls | Halve missed-call drops | No reminder, no rebooking | Reminder 15 min before + one-tap rebook |
| Recovery | Leaving means starting again | Resume from the last completed stage | No saved progress | Save and resume |
| Tier 3 calls | Approval 75.6% | Match Tier 2 (78%+) | Calls need strong network | Low-bandwidth VKYC mode |
| PAN stage | 1,874 drops | Fewer name-mismatch drops | No guidance on mismatch | Clear message on how to fix the name (next phase) |
| Agent staffing | Planned without slot data | Shifts follow booked demand | No demand view | Ops dashboard of booked slots |
