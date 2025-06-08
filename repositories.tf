resource "github_repository" "repo_to_create" {
  name                        = var.repo_name
  description                 = var.repo_description
  visibility                  = var.repo_visibility
  template {
    owner      = "jinyang628"
    repository = "fullstack-template"
  }
  allow_merge_commit          = false
  allow_rebase_merge          = false
  allow_squash_merge          = true
  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "BLANK"
  delete_branch_on_merge      = true
  auto_init                   = true
}