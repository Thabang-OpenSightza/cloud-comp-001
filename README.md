cloud-comp-001
GCP cloud architecture, Infrastructure as Code (Terraform), and multi-tenant deployment automation for OpenSightZA's Zero-Risk Rent-to-Buy digital transformation platform. Hosted in africa-south1 (Johannesburg).

OpenSightZA Cloud Computing Architecture & Infrastructure

Welcome to the official Cloud Computing portfolio and infrastructure repository for OpenSightZA. 

This repository serves two primary purposes:
1. Academic Portfolio: Demonstrating practical applications of Cloud Computing concepts (IaaS, PaaS, Multi-Tenancy, Infrastructure as Code) for university elective requirements.
2. Business Infrastructure: Housing the foundational cloud architecture, deployment automation, and technical documentation for OpenSightZA's "Zero-Risk Rent-to-Buy" digital transformation platform.

About OpenSightZA
OpenSightZA is a digital transformation agency built for the African market. We eliminate upfront Capital Expenditure (CapEx) risks for SMEs and Enterprises by offering custom web applications and AI automation with R0.00 upfront development fees. 

Clients pay a predictable monthly Operational Expenditure (OpEx) retainer. Through our proprietary Rent-to-Buy structure, a portion of every payment buys down the ownership of the software, eventually transferring 100% of the Intellectual Property (IP) to the client.

Cloud Architecture & Strategy
Our cloud strategy is designed around security, local compliance, and cost-efficiency.

Cloud Provider: Google Cloud Platform (GCP)
Primary Region: `africa-south1` (Johannesburg, South Africa)
Compliance: Strict adherence to POPIA (Protection of Personal Information Act) through local data sovereignty.
Financial Architecture: "Zero Infrastructure Risk" model. Clients create their own GCP billing accounts, ensuring OpenSightZA carries zero server cost risk while maintaining deployment access via strict IAM policies.

Technology Stack
Infrastructure as Code (IaC): Terraform (for automated, repeatable GCP deployments)
Compute & Networking: GCP Compute Engine, Cloud VPC, Cloud Load Balancing
Databases: Cloud SQL (PostgreSQL/MySQL)
Storage: Cloud Storage (Regional buckets in `africa-south1`)
CI/CD & Version Control: GitHub Actions, Git

Repository Structure

text
opensightza-cloud-computing/
│
├── README.md                  # Project overview and documentation
── business-plan/             # OpenSightZA Business Plan & Financial Models
│   └── OSZA_Businessplan.html 
│
├── architecture/              # Cloud architecture diagrams and design docs
│   └── multi-tenant-architecture.md
│
├── infrastructure/            # Terraform code for GCP resource provisioning
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── deployment/                # CI/CD pipelines and deployment scripts
│   └── github-actions/
│
└── cost-optimization/         # Budget alerts and resource scaling strategies
    └── budget-alerts.tf
