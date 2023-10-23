# Create a Google Artifact Registry repository
resource "google_artifact_registry_repository" "repository" {
  repository_id = "my-repository"
  format       = "DOCKER"
  location     = "us-east1"
  description  = "My Artifact Repository"
}

# Output the repository URL
output "repository_url" {
  value = google_artifact_registry_repository.repository.name
}