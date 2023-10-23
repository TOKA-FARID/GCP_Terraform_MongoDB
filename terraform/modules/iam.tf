# IAM: Create service accounts and associate roles
resource "google_service_account" "service_account_1" {
  account_id   = "service-account-1"
  display_name = "service-account-1"
}

resource "google_service_account" "service_account_2" {
  account_id   = "service-account-2"
  display_name = "service-account-2"
}

resource "google_project_iam_binding" "project_binding_1" {
  project = "cogent-array-401119"
  role    = "roles/iam.serviceAccountUser"
  
  members = [
    "serviceAccount:${google_service_account.service_account_1.email}",
  ]
}

resource "google_project_iam_binding" "project_binding_2" {
  project = "cogent-array-401119"
  role    = "roles/compute.admin"
  
  members = [
    "serviceAccount:${google_service_account.service_account_2.email}",
  ]
}