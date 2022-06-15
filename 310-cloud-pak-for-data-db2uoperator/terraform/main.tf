module "gitops_repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops?ref=v1.18.1"

  branch = var.gitops_repo_branch
  gitea_host = var.gitops_repo_gitea_host
  gitea_org = var.gitops_repo_gitea_org
  gitea_token = var.gitops_repo_gitea_token
  gitea_username = var.gitops_repo_gitea_username
  gitops_namespace = var.gitops_repo_gitops_namespace
  host = var.gitops_repo_host
  org = var.gitops_repo_org
  public = var.gitops_repo_public
  repo = var.gitops_repo_repo
  sealed_secrets_cert = var.gitops_repo_sealed_secrets_cert
  server_name = var.gitops_repo_server_name
  strict = var.gitops_repo_strict
  token = var.gitops_repo_token
  type = var.gitops_repo_type
  username = var.gitops_repo_username
}
module "gitops-db2u" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-db2u-operator?ref=v1.1.0"

  channel = var.gitops-db2u_channel
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  operator_namespace = var.gitops-db2u_operator_namespace
  server_name = module.gitops_repo.server_name
  subscription_source = var.gitops-db2u_subscription_source
  subscription_source_namespace = var.gitops-db2u_subscription_source_namespace
}
module "gitops-db2u_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.11.2"

  argocd_namespace = var.gitops-db2u_namespace_argocd_namespace
  ci = var.gitops-db2u_namespace_ci
  create_operator_group = var.gitops-db2u_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.gitops-db2u_namespace_name
  server_name = module.gitops_repo.server_name
}
