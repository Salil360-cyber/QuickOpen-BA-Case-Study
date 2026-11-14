# 7. User stories and acceptance criteria

**Epic E1: Video KYC experience** · **Epic E2: Journey recovery**

| ID | Epic | User story | Priority |
| --- | --- | --- | --- |
| US-01 | E1 | As a new customer, I want to book a Video KYC slot at a time that suits me, so that I do not wait long for an agent. | Must |
| US-02 | E1 | As a new customer, I want a reminder before my Video KYC call, so that I do not miss it. | Must |
| US-03 | E1 | As a new customer, I want to rebook a missed call with one tap, so that I do not have to restart. | Must |
| US-04 | E1 | As a new customer, I want to reschedule my slot, so that I can change it if my plans change. | Must |
| US-05 | E1 | As a VKYC operations manager, I want to see booked slots by time band, so that I can plan agent shifts. | Should |
| US-06 | E1 | As an admin, I want to set slot capacity per time band, so that bookings match available agents. | Should |
| US-07 | E2 | As a new customer, I want to leave and resume from my last completed step, so that I do not lose my progress. | Should |
| US-08 | E2 | As a new customer, I want to see a progress bar, so that I know how many steps are left. | Should |
| US-09 | E1 | As a customer on a weak network, I want a low-bandwidth Video KYC option, so that my call does not fail. | Could |
| US-10 | E2 | As a new customer, I want to be told why my PAN name does not match and how to fix it, so that I can continue. | Could |

## Acceptance criteria (Given-When-Then)

**US-01 Book a slot**
- Given I have completed Aadhaar eKYC, when I reach Video KYC, then I see available slots for the next 3 days by time band.
- Given I select a slot, when I tap Confirm, then I see a confirmation with date and time and receive it by SMS.
- Given a slot is full, when I view slots, then it is shown as unavailable.

**US-02 Reminder**
- Given I have a booked slot, when it is 15 minutes before the slot, then I receive an SMS and an app notification.

**US-03 Rebook a missed call**
- Given I missed my slot, when I open the app or the SMS link, then I can pick a new slot without repeating earlier steps.

**US-04 Reschedule**
- Given I have a booked slot, when I choose Reschedule at least 30 minutes before it, then my old slot is released and the new one is confirmed.

**US-05 Ops view of booked slots**
- Given I am a VKYC operations manager, when I open the slot dashboard, then I see booked vs available slots by day and time band.

**US-06 Slot capacity**
- Given I am an admin, when I set capacity for a time band, then customers cannot book more slots than that capacity.

**US-07 Save and resume**
- Given I completed stage 3, when I close the app and log in within 7 days, then I continue from stage 4.

**US-08 Progress bar**
- Given I am in the journey, when I move to the next stage, then the progress bar shows "Step X of 7".

**US-09 Low-bandwidth mode**
- Given my connection is weak, when I join the call, then I am offered a lower-quality video mode that still meets KYC rules.

**US-10 PAN name guidance**
- Given my PAN name does not match my entered name, when I submit, then I see which field differs and how to correct it.
