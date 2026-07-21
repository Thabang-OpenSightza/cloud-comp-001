# OpenSightZA Cloud Cost Strategy
# OpenSightZA Cloud FinOps & Cost Optimization Strategy

## 1. The "Zero-Risk" Financial Architecture
OpenSightZA operates on a proprietary "Zero-Risk Rent-to-Buy" model. A core pillar of this model is the separation of infrastructure billing from service retainers:
- **Infrastructure Layer (IaaS/PaaS):** The client creates their own Google Cloud Platform (GCP) account and attaches their own payment method. They pay Google directly for raw compute, storage, and AI API usage.
- **Service Layer (OpEx):** The client pays OpenSightZA a flat R3,500/month retainer for development, maintenance, security, and portal access.

**Strategic Advantage:** This eliminates infrastructure risk for OpenSightZA. We never carry server costs on our balance sheet while waiting for client payments.

## 2. Target Unit Economics
To ensure the model remains frictionless for African SMEs and Enterprises, we enforce strict FinOps guardrails:
- **Target Client Infrastructure Cost:** R150 – R500 / month (Paid to GCP).
- **Target OpenSightZA Overhead:** ~R100 / month / client (Shared agency tools, centralized monitoring).
- **Net OpenSightZA Profit:** R1,400 / month / client (after R2,000 IP buydown credit).

## 3. Automated Cost Controls (Preventing "Sticker Shock")
Non-technical SMEs are highly sensitive to unexpected cloud bills. To prevent this, OpenSightZA automates the following FinOps controls during client onboarding via Infrastructure as Code (Terraform):

1. **Hard Budget Alerts:** Automated GCP Billing Budgets are created for every client project, with email alerts triggered at 50%, 75%, 90%, and 100% of the R500/month threshold.
2. **Resource Lifecycle Rules:** Temporary files, build artifacts, and old logs are automatically deleted after 30–90 days to prevent storage bloat.
3. **Region Locking:** All resources are strictly confined to `africa-south1` (Johannesburg). This prevents accidental deployment to more expensive regions (e.g., `europe-west`) and ensures POPIA data sovereignty.
4. **Right-Sizing:** Default compute instances are configured to the smallest viable machine type (e.g., `e2-micro` or `e2-small`) with auto-scaling enabled, rather than over-provisioning static resources.

## 4. Future Optimization (Year 2+)
As our client base scales to 45+ active nodes, OpenSightZA will implement:
- **Committed Use Discounts (CUDs):** Purchasing 1-year or 3-year commitments for predictable baseline compute, reducing costs by up to 37%.
- **Sustained Use Discounts:** Leveraging GCP's automatic discounts for resources running consistently throughout the month.
