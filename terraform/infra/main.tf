module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  project_name = "three-tier-project"
  public_subnet = ["10.0.1.0/24", "10.0.3.0/24"]
  availability_zones_public = ["us-east-1a", "us-east-1c"]
  private_subnet = "10.0.2.0/24"
  private_availability_zone = "us-east-1b"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.31.6"
  cluster_name = "activity-eks-cluster"
  cluster_version = "1.31"

  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true 

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_id

  eks_managed_node_groups = {
   activity_nodes = {
      name         = "activity-node-group"
      min_size     = 2
      max_size     = 2
      desired_size = 2

      instance_types = ["t2.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }
}


