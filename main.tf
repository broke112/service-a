# main.tf

# 1. AWS Caller Identity & Region
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# 2. VPCs
data "aws_vpcs" "all" {}

# 3. Subnets
data "aws_subnets" "all" {}

# 4. Security Groups
data "aws_security_groups" "all" {}

# 5. EC2 Instances
data "aws_instances" "all" {
  instance_state_names = ["running", "stopped"]
}

# -----------------------------------------------------------
# Outputs for Discovery and InfraGraph Mapping
# -----------------------------------------------------------
output "aws_account_id" {
  description = "Connected AWS Account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "Target AWS Region"
  value       = data.aws_region.current.name
}

output "vpc_ids" {
  description = "Discovered VPC IDs in Region"
  value       = data.aws_vpcs.all.ids
}

output "subnet_ids" {
  description = "Discovered Subnet IDs in Region"
  value       = data.aws_subnets.all.ids
}

output "discovered_ec2_instances" {
  description = "Discovered EC2 Instance IDs"
  value       = data.aws_instances.all.ids
}
