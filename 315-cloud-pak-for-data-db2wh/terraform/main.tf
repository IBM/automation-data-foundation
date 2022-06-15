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
module "gitops-cp-db2wh" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp-db2wh?ref=v1.2.1"

  channel = var.gitops-cp-db2wh_channel
  cluster_ingress_hostname = var.gitops-cp-db2wh_cluster_ingress_hostname
  cluster_type = var.gitops-cp-db2wh_cluster_type
  common_services_namespace = var.gitops-cp-db2wh_common_services_namespace
  cpd_namespace = var.gitops-cp-db2wh_cpd_namespace
  db2_warehouse_channel = var.gitops-cp-db2wh_db2_warehouse_channel
  db2_warehouse_version = var.gitops-cp-db2wh_db2_warehouse_version
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  license = var.gitops-cp-db2wh_license
  namespace = module.gitops-cp-db2wh_namespace.name
  operator_namespace = var.gitops-cp-db2wh_operator_namespace
  server_name = module.gitops_repo.server_name
  storage_class = var.gitops-cp-db2wh_storage_class
  subscription_source_namespace = var.gitops-cp-db2wh_subscription_source_namespace
  tls_secret_name = var.gitops-cp-db2wh_tls_secret_name
}
module "gitops-cp-db2wh_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.11.2"

  argocd_namespace = var.gitops-cp-db2wh_namespace_argocd_namespace
  ci = var.gitops-cp-db2wh_namespace_ci
  create_operator_group = var.gitops-cp-db2wh_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.gitops-cp-db2wh_namespace_name
  server_name = module.gitops_repo.server_name
}
