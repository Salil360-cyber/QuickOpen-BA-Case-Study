# 10. Impact and ROI estimate

## Assumption

Slot booking and reminders bring the failure rate of calls that today wait **16-30** and **30+** minutes down to the **6-15 minute** level (**18.1%**).

## Calculation

| Step | Value |
| --- | --- |
| Calls waiting 16-30 min | 3,659 at 28.9% failure |
| Calls waiting 30+ min | 1,325 at 45.4% failure |
| Failures today in these two buckets | about 1,659 |
| Failures at 18.1% | about 902 |
| Extra customers passing Video KYC | **about 757** |
| Share of customers who complete after passing VKYC | 10,526 / 11,401 = 92.3% |
| Extra completed accounts per 6 months | **about 700** |
| New completion rate | (10,526 + 700) / 20,000 = **about 56.1%** (from 52.6%) |

## Notes

- This is the effect of one fix only; reminders on short waits, save-and-resume and PAN guidance would add to it.
- Rupee ROI needs two inputs from the bank: cost to build the features and the value of a new account (deposits, fees, cross-sell). With those, ROI = (extra accounts × value per account − cost) / cost.
- After launch, track: completion %, % of VKYC calls waiting over 15 minutes, missed-call drops, and rebooking rate.
