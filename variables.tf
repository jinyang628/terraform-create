variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "GitHub Account/Organization Name"
  type        = string
}

variable "repo_name" {
  description = "Name of the repository to create"
  type        = string
}

variable "repo_description" {
  description = "Description of the repository"
  type        = string
}

variable "repo_visibility" {
  description = "Visibility of the repository (public or private)"
  type        = string
  validation {
    condition     = contains(["public", "private"], var.repo_visibility)
    error_message = "Repository visibility must be either 'public' or 'private'."
  }
}

variable "collaborators" {
  description = "Map of GitHub usernames to their permission levels (pull, push, admin, maintain, triage)"
  type        = map(string)
  default     = {}
  validation {
    condition     = alltrue([for perm in values(var.collaborators) : contains(["pull", "push", "admin", "maintain", "triage"], perm)])
    error_message = "Permission must be one of: pull, push, admin, maintain, triage"
  }
}