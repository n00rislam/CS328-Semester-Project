module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.15.3"

  cluster_name    = "my-cluster"
  cluster_version = "1.29"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  enable_irsa = true

  tags = local.tags
}

# Security group for the node group
resource "aws_security_group" "node_group_one" {
  name_prefix = "node_group_one"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }

  tags = local.tags
}

# Security group rules
resource "aws_security_group_rule" "node_group_one_ingress_self" {
  description              = "Allow node to communicate with each other"
  from_port               = 0
  protocol                = "-1"
  security_group_id       = aws_security_group.node_group_one.id
  source_security_group_id = aws_security_group.node_group_one.id
  to_port                 = 65535
  type                    = "ingress"
}

resource "aws_security_group_rule" "node_group_one_egress" {
  description = "Allow all egress traffic"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.node_group_one.id
  type             = "egress"
} 
