# JFrog platform variables
variable "artifactory_url" {
    description = "The URL of the Artifactory instance"
    type = string
    default = "https://myartifactory.jfrog.io" 
}

variable "artifactory_access_token" {
    sensitive = true
    description = "The access token for the Artifactory instance"
    type = string
}

# JFrog project variables
variable "artifactory_project" {
    description = "The name of the project that will be created in Artifactory"
    type = string
}
variable "artifactory_project_key" {
    description = "The project key of the project that will be created in Artifactory"
    type = string
}

variable "artifactory_project_description" {
    description = "The description of the project that will be created in Artifactory"
    type = string
}
    
variable "max_storage_in_gibibytes" {
    description = "The maximum storage in GiB for the project"
    type = number
    default = 10
}

variable "block_deployments_on_limit" {
    description = "Whether to block deployments when the storage limit is reached"
    type = bool
    default = false
}
variable "email_notification" {
    description = "Whether to send email notifications when the storage limit is reached"
    type = bool
    default = true
}

variable "manage_members" {
    description = "Whether to allow project members to be managed"
    type = bool
    default = true
  
}

variable "manage_resources" {
    description = "Whether to allow project resources to be managed"
    type = bool
    default = true
}

variable "index_resources" {
    description = "Whether to allow project resources to be indexed"
    type = bool
    default = true
  }

# JFrog remote repository variables
variable "artifactory_remote_repo" {
    description = "The name of the remote repository that will be created in Artifactory"
    type = string
}

variable "artifactory_remote_repo_xrays_index" {
    description = "Whether to index the remote repository with Xray"
    type = bool
    default = true
  
}
variable "artifactory_remote_repo_description" {
    description = "The description of the remote repository that will be created in Artifactory"
    type = string
  
}
variable "artifactory_remote_repo_url" {
    description = "The URL of the remote repository that will be created in Artifactory"
    type = string
  
}

variable "artifactory_remote_repo_environment" {
    description = "The environment of the remote repository that will be created in Artifactory"
    type = string
  
}

# JFrog local repository variables
variable "artifactory_local_repo" {
    description = "The name of the local repository that will be created in Artifactory"
    type = string

}

variable "artifactory_local_repo_environment" {
    description = "The environment of the local repository that will be created in Artifactory"
    type = string
}

# JFrog virtual repository variables
variable "artifactory_virtual_repo" {
    description = "The name of the virtual repository that will be created in Artifactory"
    type = string
}

variable "artifactory_virtual_repo_environment" {
    description = "The environment of the virtual repository that will be created in Artifactory"
    type = string
}

variable "artifactory_local_repo_description" {
    description = "The description of the local repository that will be created in Artifactory"
    type = string
}

variable "artifactory_virtual_repo_description" {
    description = "The description of the local repository that will be created in Artifactory"
    type = string
}