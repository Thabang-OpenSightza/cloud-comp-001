# ==============================================================================
# OpenSightZA - FinOps: Automated GCP Budget & Alerting
# Purpose: Prevent client "sticker shock" by enforcing strict billing guardrails
# Target: Keep client infrastructure costs between R150 - R500 / month
# ==============================================================================

# 1. Define the Billing Budget for the Client's Project
resource "google_billing_budget" "client_infrastructure_budget" {
  billing_account = var.billing_account_id # Passed from the client's GCP setup
  
  budget_filter {
    projects = ["projects/${var.project_id}"]
    # Optional: Filter by specific services if needed (e.g., only Compute Engine)
  }

  # Set the budget amount (Note: GCP Billing API uses the currency of the billing account)
  amount {
    specified_amount {
      # Assuming ZAR billing account. Adjust multiplier if billing account is in USD.
      units = "500" 
    }
  }

  # 2. Define Threshold Rules for Progressive Alerting
  threshold_rules {
    threshold_percent = 0.50 # Alert at 50% (R250)
    spend_basis        = "CURRENT_SPEND"
  }

  threshold_rules {
    threshold_percent = 0.75 # Alert at 75% (R375)
    spend_basis        = "CURRENT_SPEND"
  }

  threshold_rules {
    threshold_percent = 0.90 # Alert at 90% (R450) - Critical Warning
    spend_basis        = "CURRENT_SPEND"
  }

  threshold_rules {
    threshold_percent = 1.00 # Alert at 100% (R500) - Budget Exceeded
    spend_basis        = "CURRENT_SPEND"
  }

  # 3. Notification Channels (Email alerts to both Client and OpenSightZA)
  all_updates_rule {
    monitoring_notification_channels = [google_monitoring_notification_channel.email_alert.id]
    
    # Disable default pubsub if not needed, keep it clean
    disable_default_iam_recipients = true 
  }
}

# 4. Define the Email Notification Channel
resource "google_monitoring_notification_channel" "email_alert" {
  display_name = "OpenSightZA FinOps Alert Channel"
  type         = "email"
  
  labels = {
    # Comma-separated list of emails. 
    # Example: client-owner@theirdomain.com, thabang.ndweni@opensightza.co.za
    email_address = var.finops_alert_emails 
  }
}

# Variables required for this module
variable "billing_account_id" {
  description = "The GCP Billing Account ID of the client"
  type        = string
}

variable "finops_alert_emails" {
  description = "Comma-separated list of emails to notify when budget thresholds are hit"
  type        = string
  default     = "thabang.ndweni@opensightza.co.za" # Default to founder for safety
}
