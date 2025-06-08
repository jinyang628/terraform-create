resource "github_repository_collaborator" "collaborators" {
  for_each = var.collaborators

  repository = github_repository.repo_to_create.name
  username   = each.key
  permission = each.value
}