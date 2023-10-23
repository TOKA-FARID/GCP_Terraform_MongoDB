# Google Cloud Project - Skills Assessment 🚀

## Project Overview 📋

Welcome to the Google Cloud Project - Skills Assessment. This project is designed to evaluate expertise in Google Cloud ☁️, Networking 🌐, Database 📊, Development 💻, Terraform 🏗️, Docker 🐳, and Kubernetes ☸️. In this comprehensive challenge, I deployed a simple web app Node.js web application (stateless) that interacts seamlessly with a highly available MongoDB (stateful) replica set, spanning across three zones on Google Cloud Platform (GCP). I architect and provision the necessary infrastructure using custom Terraform modules, and meticulously orchestrate the entire solution.

The key tasks in this project include:

1. **Develop Terraform Infrastructure:**
    - Create and configure IAM roles with two service accounts for specific purposes.
    - Implement an optimized network configuration, which includes a single VPC, two subnets, multiple firewall rules, and a NAT gateway for internet access.
    - Deploy a private VM and a GKE standard cluster that spans three zones.
    - Set up an Artifact Registry repository to efficiently manage and store container images.

2. **Deploy MongoDB Replica Set:**
    - Implement a highly available MongoDB replica set, expertly distributed across three zones in GCP, featuring one primary and two secondary instances.

3. **Dockerize and Deploy Node.js Web Application:**
    - Dockerize your Node.js web application, ensuring that it's lightweight, scalable, and highly performant.
    - Deploy the Node.js app to your GKE cluster, configuring it to seamlessly connect to the three MongoDB replica nodes.

4. **Expose the Web Application:**
    - Securely expose your Node.js web application to the public internet. You can choose to set up an Ingress controller or employ a Load Balancer, selecting the most appropriate approach to meet your requirements.
      

## Prerequisites 🛠️

Before you proceed with this project, please ensure you have the following prerequisites:

- An active Google Cloud Platform (GCP) account.
- The `gcloud` CLI tool installed and configured.
- Terraform installed on your local machine, equipped with the latest GCP provider.
- Docker installed locally, along with knowledge of containerization best practices.

## How to Run This Project 🛠️

To successfully deploy and showcase this project, follow these carefully crafted steps:

1. **Clone the Repository:**
   Begin by cloning the project repository to your local machine. You can do this by running the following command:

   ```bash
   git clone https://github.com/TOKA-FARID/GCP_project
   cd GCP_project

2. **Initialize Terraform:**
   To initialize Terraform and set up the required providers and modules, execute the following command:
   
   ```bash
   terraform init

4. **Create the Infrastructure:**
   With the setup complete, create the GCP infrastructure by running the following Terraform command:

    ```bash
   terraform apply
 
 5. **Dockerize and deploy the Node.js web application:**
    Follow the instructions in the project's Dockerfile to containerize the Node.js web app.
    Push the Docker image to the Artifact Registry repository.
    Deploy the containerized web app to the GKE cluster.

 6. **Expose the web application:**
    Configure either an ingress controller or a load balancer to make the web application accessible to the public.
    Ensure the configuration handles incoming traffic securely.

  7. **Clean up the resources:**
     After completing the project, it's essential to clean up the resources on GCP to prevent unexpected charges. Run the following command to destroy the created infrastructure:

     ```bash
     terraform destroy

  ## Additional Resources 📚
  
  To help you excel in this project, consider exploring these additional resources:

  1. Google Cloud Platform (GCP)
  2. Terraform Documentation
  3. Docker Documentation
  4. Google Kubernetes Engine (GKE) Documentation
  5. Google Cloud MongoDB
  
  If you encounter any questions, challenges, or require further assistance, don't hesitate to reach out for support.
