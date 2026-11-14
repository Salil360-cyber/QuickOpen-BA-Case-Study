# Business Requirements Document (BRD)

**Project:** QuickOpen: Digital Account Onboarding Improvement
**Organisation:** Sahyadri Bank (fictional) · **Prepared by:** Salil Gokhale, Business Analyst · **Version:** 1.0 · **Status:** Draft for review

## 1. Background

Sahyadri Bank offers a zero-balance savings account that customers can open fully online through a 7-stage journey. Between April and September 2026, 20,000 customers started the journey.

## 2. Problem statement

Only 52.6% of customers who start complete the journey. Video KYC is the biggest drop point, losing 3,176 of 14,577 customers (21.8%). Video KYC failure rises from 11.2% at waits of 5 minutes or less to 45.4% above 30 minutes, and night slots wait longest (27.5 minutes on average).

## 3. Objectives

1. Raise journey completion from 52.6% to at least 56% within 6 months of launch.
2. Reduce Video KYC calls waiting more than 15 minutes from 34% to under 15%.
3. Halve drops caused by missed Video KYC calls (1,365 today).

## 4. Scope

**In scope:** Video KYC slot booking, reminders, rebooking and rescheduling; slot capacity and ops view; save and resume; progress bar; low-bandwidth Video KYC (Could); PAN name-mismatch guidance (Could).
**Out of scope:** changes to RBI KYC rules or documents, core banking changes, marketing, branch onboarding.

## 5. Stakeholders

See [02_stakeholders_raci.md](02_stakeholders_raci.md). Sponsor: Head of Digital Banking. Key consulted groups: Compliance/KYC, Video KYC operations, IT, QA.

## 6. Current process (AS-IS)

See [03_process_flows.md](03_process_flows.md). Customers enter a live Video KYC queue with no booking, reminder or recovery. A missed or failed call ends the journey.

## 7. Data findings

| # | Finding |
| --- | --- |
| 1 | 52.6% completion (10,526 of 20,000). |
| 2 | Video KYC loses 3,176 customers, the largest drop; PAN Verification is second (1,874). |
| 3 | VKYC failure: 11.2% (0-5 min wait), 18.1% (6-15), 28.9% (16-30), 45.4% (30+). |
| 4 | Night waits average 27.5 min vs 5.5 min in the morning; night failure 33.8%. |
| 5 | Tier 3 approval is 75.6% vs 79.7% in Tier 1 at the same ~14 min wait, pointing to network quality. |

Source: [../03_sql/results.md](../03_sql/results.md) and [../02_excel/QuickOpen_Analysis.xlsx](../02_excel/QuickOpen_Analysis.xlsx).

## 8. Business requirements

| ID | Requirement | Priority |
| --- | --- | --- |
| BR-01 | Customers can book a Video KYC slot for the next 3 days. | Must |
| BR-02 | Customers are reminded 15 minutes before their slot by SMS and app notification. | Must |
| BR-03 | Customers can rebook a missed call and reschedule a booked one without repeating earlier steps. | Must |
| BR-04 | VKYC operations can see booked vs available slots and set capacity per time band. | Should |
| BR-05 | Customers can resume the journey from their last completed stage within 7 days, with a progress indicator. | Should |
| BR-06 | Video KYC offers a low-bandwidth mode that still meets KYC rules. | Could |
| BR-07 | Customers see which name field differs from PAN and how to correct it. | Could |

Detailed user stories: [07_user_stories.md](07_user_stories.md).

## 9. Non-functional requirements

| ID | Requirement |
| --- | --- |
| NFR-01 | Slot list loads within 2 seconds. |
| NFR-02 | Reminders are sent within 1 minute of the scheduled time. |
| NFR-03 | Saved journey data is encrypted and kept no longer than 7 days if not completed. |
| NFR-04 | All Video KYC changes follow RBI KYC requirements, reviewed by Compliance before release. |
| NFR-05 | Booking works on Android, iOS and web. |

## 10. Assumptions

- Agent shifts can be adjusted to booked demand.
- Customers accept booking a slot instead of waiting in a live queue.
- SMS and push notification services are already available.

## 11. Constraints

- RBI KYC rules on Video KYC cannot be changed.
- Agent headcount may not increase in the first phase.

## 12. Risks and mitigation

| Risk | Mitigation |
| --- | --- |
| Customers book far ahead and drop anyway | Limit booking to 3 days; send reminders |
| Evening/night slots fill up | Ops dashboard to move agents to peak bands |
| Compliance delays | Involve Compliance from the design stage |

## 13. Success KPIs

Journey completion %, % of VKYC calls waiting over 15 minutes, missed-call drops, rebooking rate, VKYC approval % by city tier.

## 14. Expected impact

About 700 extra completed accounts per 6 months from slot booking alone, raising completion from 52.6% to about 56.1%. See [10_ROI_estimate.md](10_ROI_estimate.md).

## 15. Appendix

User stories ([07](07_user_stories.md)), RTM ([08](08_RTM.csv)), UAT cases ([09](09_UAT_test_cases.md)), wireframes ([../06_design](../06_design)).

---
*Case study on synthetic data; the bank, stakeholders and approvals are fictional.*
