# jfrog-terraform-rpm-projects
Some simple terraform to deploy a project and setup some RPM repos to pull from Rocky Linux.
## Install terraform on your system
[Installation instructions](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
## Configure your variables
make a copy and edit ```example.tfvars``` to suit your environment. 

## Initialise the repo
```shell
➜  jfrog-terraform-rpm-projects git:(main) terraform init
Initializing the backend...
Initializing provider plugins...
- Finding jfrog/artifactory versions matching "12.0.0"...
- Finding jfrog/project versions matching "1.7.1"...
- Installing jfrog/artifactory v12.0.0...
- Installed jfrog/artifactory v12.0.0 (signed by a HashiCorp partner, key ID 2FA4D2A520237FA7)
- Installing jfrog/project v1.7.1...
- Installed jfrog/project v1.7.1 (signed by a HashiCorp partner, key ID 2FA4D2A520237FA7)
Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## Terraform apply
```shell
➜  jfrog-terraform-rpm-projects git:(main) ✗ tf plan --var-file=/Users/myork/.tfvars/matthewy-projects-example.tfvars

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # artifactory_local_rpm_repository.rocky-local will be created
  + resource "artifactory_local_rpm_repository" "rocky-local" {
      + blacked_out                = false
      + calculate_yum_metadata     = true
      + cdn_redirect               = false
      + description                = "The Rocky Linux RPM local repository"
      + enable_file_lists_indexing = true
      + id                         = (known after apply)
      + includes_pattern           = "**/*"
      + key                        = "rocky-linux-tf-local"
      + package_type               = (known after apply)
      + priority_resolution        = false
      + project_environments       = [
          + "DEV",
        ]
      + project_key                = "rocky-linux-tf"
      + repo_layout_ref            = "simple-default"
      + xray_index                 = true
      + yum_root_depth             = 5
    }

  # artifactory_remote_rpm_repository.rocky-remote will be created
  + resource "artifactory_remote_rpm_repository" "rocky-remote" {
      + allow_any_host_auth                   = false
      + archive_browsing_enabled              = false
      + assumed_offline_period_secs           = 300
      + blacked_out                           = false
      + block_mismatching_mime_types          = true
      + bypass_head_requests                  = false
      + cdn_redirect                          = false
      + client_tls_certificate                = (known after apply)
      + description                           = "The Rocky Linux RPM repository"
      + disable_proxy                         = false
      + disable_url_normalization             = false
      + download_direct                       = false
      + enable_cookie_management              = false
      + hard_fail                             = false
      + id                                    = (known after apply)
      + includes_pattern                      = "**/*"
      + key                                   = "rocky-linux-tf-remote"
      + list_remote_folder_items              = false
      + metadata_retrieval_timeout_secs       = 60
      + missed_cache_period_seconds           = 1800
      + offline                               = false
      + package_type                          = (known after apply)
      + priority_resolution                   = false
      + project_environments                  = [
          + "DEV",
        ]
      + project_key                           = "rocky-linux-tf"
      + repo_layout_ref                       = "simple-default"
      + retrieval_cache_period_seconds        = 7200
      + share_configuration                   = (known after apply)
      + socket_timeout_millis                 = 15000
      + store_artifacts_locally               = true
      + synchronize_properties                = false
      + unused_artifacts_cleanup_period_hours = 0
      + url                                   = "http://dl.rockylinux.org/"
      + xray_index                            = true

      + content_synchronisation (known after apply)
    }

  # artifactory_virtual_rpm_repository.rocky-virtual will be created
  + resource "artifactory_virtual_rpm_repository" "rocky-virtual" {
      + artifactory_requests_can_retrieve_remote_artifacts = false
      + description                                        = "The Rocky Linux RPM virtual repository"
      + id                                                 = (known after apply)
      + includes_pattern                                   = "**/*"
      + key                                                = "rocky-linux-tf-virtual"
      + package_type                                       = (known after apply)
      + project_environments                               = [
          + "DEV",
        ]
      + project_key                                        = "rocky-linux-tf"
      + repo_layout_ref                                    = "simple-default"
      + repositories                                       = [
          + "rocky-linux-tf-local",
          + "rocky-linux-tf-remote",
        ]
    }

  # project.myproject will be created
  + resource "project" "myproject" {
      + block_deployments_on_limit      = false
      + description                     = "This is a project for Rocky Linux created by Terraform"
      + display_name                    = "rocky-linux-tf"
      + email_notification              = true
      + id                              = (known after apply)
      + key                             = "rocky-linux-tf"
      + max_storage_in_gibibytes        = 10
      + use_project_group_resource      = true
      + use_project_repository_resource = true
      + use_project_role_resource       = true
      + use_project_user_resource       = true

      + admin_privileges {
          + index_resources  = true
          + manage_members   = true
          + manage_resources = true
        }
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + artifactory_url = "REDACTED"

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
"terraform apply" now.
```

## Apply the new state to the platform
```shell
tf apply --var-file=/Users/myork/.tfvars/matthewy-projects-example.tfvars
```
