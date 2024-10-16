# Create the rocky remote repository
resource "artifactory_remote_rpm_repository" "rocky-remote" {
  key             = "${var.artifactory_remote_repo}"
  url             = "${var.artifactory_remote_repo_url}"
  description     = "${var.artifactory_remote_repo_description}"
  project_environments = ["${var.artifactory_remote_repo_environment}"]
  xray_index     = "${var.artifactory_remote_repo_xrays_index}"
  project_key     = "${var.artifactory_project_key}"
}

resource "artifactory_local_rpm_repository" "rocky-local" {
  key                        = "${var.artifactory_local_repo}"
  yum_root_depth             = 5
  calculate_yum_metadata     = true
  enable_file_lists_indexing = true
  description     = "${var.artifactory_local_repo_description}"
  project_environments = ["${var.artifactory_remote_repo_environment}"]
  xray_index     = "${var.artifactory_remote_repo_xrays_index}"
  project_key     = "${var.artifactory_project_key}"

  #yum_group_file_names       = "file-1.xml,file-2.xml"
}

resource "artifactory_virtual_rpm_repository" "rocky-virtual" {
    key             = "${var.artifactory_virtual_repo}"
    repositories    = ["${artifactory_local_rpm_repository.rocky-local.key}",
                        "${artifactory_remote_rpm_repository.rocky-remote.key}"]
    description     = "${var.artifactory_virtual_repo_description}"
    project_environments = ["${var.artifactory_remote_repo_environment}"]
    project_key     = "${var.artifactory_project_key}"
}