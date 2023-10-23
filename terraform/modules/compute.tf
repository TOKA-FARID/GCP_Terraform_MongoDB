# Compute: Create VM and GKE Cluster
resource "google_compute_instance" "vm" {
  name         = "management-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  service_account {
    email  = google_service_account.service_account_1.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform", "userinfo-email", "compute-ro"]  
  }
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = google_compute_network.vpc.self_link
    subnetwork_project = "cogent-array-401119"
    subnetwork = google_compute_subnetwork.management-subnet.self_link
  }
}

# create cluster and GKE cluster.
resource "google_container_cluster" "gke_cluster" {
  name               = "my-cluster"
  location           = "us-east1"
  initial_node_count = 1

  # Create the cluster in the workload-subnet across 3 zones
  network = google_compute_network.vpc.self_link
  subnetwork = google_compute_subnetwork.workload-subnet.self_link
  node_locations = ["us-east1-b", "us-east1-c", "us-east1-d"]
  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }
}

