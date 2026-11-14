# 9. UAT test cases

| TC | Requirement | Steps | Expected result | Result |
| --- | --- | --- | --- | --- |
| TC-01 | BR-01 | Complete eKYC → open Video KYC → pick tomorrow, Morning → Confirm | Confirmation screen and SMS show the correct date and time band | |
| TC-02 | BR-01 | Admin sets Night capacity to 0 → customer opens slots | Night slots shown as unavailable | |
| TC-03 | BR-02 | Book a slot 20 min ahead → wait | SMS and app notification arrive 15 min before the slot | |
| TC-04 | BR-03 | Book a slot → do not join → open SMS link | New slot can be picked; stages 1-4 are not repeated | |
| TC-05 | BR-03 | Book a slot → Reschedule 1 hour before | Old slot released, new slot confirmed | |
| TC-06 | BR-04 | Ops manager opens slot dashboard | Booked vs available slots shown by day and time band | |
| TC-07 | BR-05 | Complete stage 3 → close app → log in next day | Journey resumes at stage 4 with a "Step 4 of 7" progress bar | |
| TC-08 | BR-06 | Join call on a throttled network | Low-bandwidth mode offered and call completes | |
| TC-09 | BR-07 | Enter a name that differs from PAN | Message shows the mismatched field and how to fix it | |

Result column is filled during UAT (Pass / Fail + defect ID).
