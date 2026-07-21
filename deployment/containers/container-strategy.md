# OpenSightZA Containerization Strategy

## Why We Use Docker
OpenSightZA delivers "Zero-Risk Rent-to-Buy" software to multiple SME and Enterprise clients. To ensure consistency, security, and rapid deployment, 
we package our applications using Docker.

## Multi-Tenant Benefits
1. **Environment Parity:** The application runs identically on a developer's laptop, in GitHub Actions CI/CD, and in the client's `africa-south1` GCP environment.
2. **Resource Isolation:** Each client's application sandbox can be deployed as an isolated container (e.g., via GCP Cloud Run), preventing resource contention and ensuring POPIA data separation.
3. **Cost Optimization:** Multi-stage Docker builds (as seen in our `Dockerfile`) strip out development dependencies, resulting in lightweight images. This reduces GCP storage costs and speeds up deployment times, keeping client infrastructure fees within the R150–R500/month target.
