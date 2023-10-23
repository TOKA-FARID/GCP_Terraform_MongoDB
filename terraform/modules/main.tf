# Define the provider (Google Cloud Platform)
provider "google" {
  credentials = file("/home/toka-farid/Downloads/cogent-array-401119-7677ba03eb9e.json")
  project     = "cogent-array-401119"
  region      = "us-east1"
}