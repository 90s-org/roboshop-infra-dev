module "backend_component" {
    for_each = var.components
    source = "../../terraform-aws-component"
    environment = var.environment
    component = each.key
    rule_priority = each.value.rule_priority
    app_version = "v3"
}