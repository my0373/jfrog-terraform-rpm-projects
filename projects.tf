resource "project" "myproject" {
  key = "${var.artifactory_project_key}"
  display_name = "${var.artifactory_project}"
  description  = "${var.artifactory_project_description}"
  admin_privileges {
    manage_members   = "${var.manage_members}"
    manage_resources = "${var.manage_resources}"
    index_resources  = "${var.index_resources}"
  }
  max_storage_in_gibibytes   = "${var.max_storage_in_gibibytes}"
  block_deployments_on_limit = "${var.block_deployments_on_limit}"
  email_notification         = "${var.email_notification}"
}