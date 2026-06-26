module "sgs" {
    count = length(var.sg_names)
    source = "../../terraform-aws-sg"
    project = var.project
    environment = var.environment
    sg_name = replace(var.sg_names[count.index], "_", "-")
    vpc_id = var.sg_names[count.index] == "bastion" ? var.is_bastion_in_default ? data.aws_vpc.default.id : local.vpc_id : local.vpc_id
}