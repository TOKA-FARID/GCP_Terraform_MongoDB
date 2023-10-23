# Network: Create VPC, Subnets, Firewall Rules, and NAT
# Create a VPC
resource "google_compute_network" "vpc" {
  name = "my-vpc"
  auto_create_subnetworks = false
}

# Create a Compute Subnet for Management (with specific zone (zone-a))
resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc.self_link

  secondary_ip_range {
    range_name    = "us-central1-a"
    ip_cidr_range = "10.0.3.0/28"
  }
}

resource "google_compute_subnetwork" "workload-subnet" {
  name          = "workload-subnet"
  ip_cidr_range = "10.1.0.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc.self_link

  secondary_ip_range {
    range_name    = "us-east1-a"
    ip_cidr_range = "10.1.1.0/28"
  }
  secondary_ip_range {
    range_name    = "us-east1-b"
    ip_cidr_range = "10.1.2.0/28"
  }
  secondary_ip_range {
    range_name    = "us-east1-c"
    ip_cidr_range = "10.1.3.0/28"
  }
}

# Create firewall rules
resource "google_compute_firewall" "allow-http-ssh" {
  name    = "allow-http-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# Create the NAT
resource "google_compute_router" "router" {
  name    = "my-router"
  region = google_compute_subnetwork.management-subnet.region
  network = google_compute_network.vpc.self_link
}

resource "google_compute_router_nat" "nat_config" {
  name        = "my-nat-config"
  router      = google_compute_router.router.name
  region = google_compute_subnetwork.management-subnet.region
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}