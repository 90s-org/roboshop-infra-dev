module "vpc" {
    source = "git::https://github.com/90s-org/terraform-aws-vpc.git?ref=main"
    project = var.project
    environment = var.environment
    is_peering_required = true
}