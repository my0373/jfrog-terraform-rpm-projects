# Artifactory base configuration
## example artifactory_url = "https://bigdave.jfrog.io"
artifactory_url = ""
artifactory_access_token = ""

# Artifactory project configuration
artifactory_project = "rocky-linux-tf"
artifactory_project_key = "rocky-linux-tf"
artifactory_project_description = "This is a project for Rocky Linux created by Terraform"

# Remote repository configuration
## must be 2 - 32 lowercase alphanumeric and hyphen characters
artifactory_remote_repo = "rocky-linux-tf-remote"
artifactory_remote_repo_url = "http://dl.rockylinux.org/"
artifactory_remote_repo_environment = "DEV"
artifactory_remote_repo_description = "The Rocky Linux RPM repository"

# Local repository configuration
artifactory_local_repo = "rocky-linux-tf-local"
artifactory_local_repo_environment = "DEV"
artifactory_local_repo_description = "The Rocky Linux RPM local repository"

# Virtual repository configuration
artifactory_virtual_repo = "rocky-linux-tf-virtual"
artifactory_virtual_repo_environment = "DEV"
artifactory_virtual_repo_description = "The Rocky Linux RPM virtual repository"


