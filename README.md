# AWS Multi-Tier Web Application with Terraform

**Description:**  
Infrastructure-as-Code project using Terraform to deploy a complete AWS multi-tier architecture with VPC, EC2 web server, RDS PostgreSQL, and S3 storage.

---

## Overview
This project provisions a complete AWS environment using **Terraform**, following a **multi-tier architecture**:
- **Networking**: VPC, public/private subnets, Internet & NAT Gateways.
- **Compute**: EC2 web server with Apache.
- **Database**: RDS PostgreSQL in private subnets.
- **Storage**: S3 bucket for static assets.

With Terraform, you can deploy, manage, and destroy everything with **a few commands**.

---

## Architecture
AWS Cloud  
│  
├── VPC (10.0.0.0/16)  

│   ├── Public Subnet (Web server, IGW access)  

│   ├── Private Subnet (RDS Database)  

│   └── S3 Bucket (Static assets)  

│  

└── Security Groups  
    ├── Web SG: Allow HTTP, HTTPS, SSH  
    └── DB SG: Allow PostgreSQL only from Web SG  

---

## 1. Installing Terraform

### Windows
1. Download Terraform from: [Terraform Downloads](https://developer.hashicorp.com/terraform/downloads)  
2. Extract the ZIP to a folder.  
3. Add the folder path to your **System Environment Variables → Path**.  
4. Verify installation:
```powershell
terraform -version
```
MacOS
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

```

```
terraform -version
```


```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```


```
terraform -version

```
2. AWS Setup
Before running Terraform, make sure you have:

AWS Account (Free Tier is fine)

AWS CLI installed → Install AWS CLI

Configured AWS credentials:


aws configure
Enter:

AWS Access Key ID

AWS Secret Access Key

Default region (e.g., us-east-1)

Also:

Create an EC2 Key Pair in AWS Console (e.g., my-app-key) and download the .pem file.

3. Project Structure

aws-cloud-app/
├── main.tf          # Infrastructure definitions

├── variables.tf     # Input variables

├── outputs.tf       # Output values

├── .terraform.lock.hcl

├── README.md


4. Deployment Steps
Step 1 — Initialize Terraform
```
terraform init
```
Downloads the AWS provider plugin.

Step 2 — Preview the Plan
```
terraform plan
```
Shows what resources will be created.

Step 3 — Apply Configuration
```
terraform apply
```
Type yes when prompted. Terraform will:

Create a VPC and subnets

Launch EC2 web server with Apache

Create RDS PostgreSQL in private subnets

Create S3 bucket for static files

Step 4 — View Outputs
After apply, Terraform will display:
```
vpc_id

web_server_public_ip

rds_endpoint

s3_bucket_name
```
Step 5 — Test Web Server
Visit:

```
http://<web_server_public_ip>
```
You should see:

```
Hello from your AWS Cloud App!
```
Step 6 — SSH into EC2
```
ssh -i my-app-key.pem ec2-user@<web_server_public_ip>
```
Step 7 — Connect to Database
From the EC2 instance:

```
psql -h <rds_endpoint> -U dbadmin -d myappdb
```
5. Destroying the Environment
When done, delete everything to avoid charges:

```
terraform destroy
```
Type yes when prompted.




Here’s a summary of your Terraform AWS project:

This project automates the deployment of a multi-tier web application on AWS using Terraform.
It provisions:

Networking → VPC, public & private subnets, Internet Gateway, NAT Gateway.

Compute → EC2 instance with Apache web server in a public subnet.

Database → RDS PostgreSQL in private subnets, accessible only from the web server.

Storage → S3 bucket for static assets.

You can:

Install Terraform and configure AWS credentials.

Run terraform init, terraform plan, and terraform apply to deploy.

Get outputs like public IP, RDS endpoint, and bucket name.

Access the web server via browser or SSH.

Destroy all resources with terraform destroy when done.




