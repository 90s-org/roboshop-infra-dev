module "backend_component" {
    for_each = var.components
    source = "git::https://github.com/90s-org/terraform-aws-componen.git?ref=main"
    environment = var.environment
    component = each.key
    rule_priority = each.value.rule_priority
    app_version = "v3"
}