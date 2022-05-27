module "entitlements_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.11.2"

  argocd_namespace = var.entitlements_namespace_argocd_namespace
  ci = var.entitlements_namespace_ci
  create_operator_group = var.entitlements_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.entitlements_namespace_name
  server_name = module.gitops_repo.server_name
}
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
module "gitops-global-pullsecret-synch" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-global-pullsecret-synch?ref=v0.1.1"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.entitlements_namespace.name
  server_name = module.gitops_repo.server_name
}
module "gitops-module-global-pullsecret" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-global-pullsecret?ref=v0.0.1"

  docker_password = var.entitlement_key
  docker_server = var.docker_server
  docker_username = var.docker_username
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.entitlements_namespace.name
  secret_name = var.secret_name
  server_name = module.gitops_repo.server_name
}
