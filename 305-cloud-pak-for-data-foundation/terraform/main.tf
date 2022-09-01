module "cp4d_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.12.0"

  argocd_namespace = var.cp4d_namespace_argocd_namespace
  ci = var.cp4d_namespace_ci
  create_operator_group = var.cp4d_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.cp4d_namespace
  server_name = module.gitops_repo.server_name
}
module "cp4d-instance" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp4d-instance?ref=v1.0.6"

  cp4d_instance_name = var.cp4d-instance_cp4d_instance_name
  cpd_common_services_namespace = var.cp4d-instance_cpd_common_services_namespace
  cpd_operator_namespace = var.cp4d-instance_cpd_operator_namespace
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  license_accept = var.cp4d-instance_license_accept
  license_type = var.cp4d-instance_license_type
  namespace = module.cp4d_namespace.name
  server_name = module.gitops_repo.server_name
  storage_vendor = var.cp4d-instance_storage_vendor
}
module "cpd_operators_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.12.0"

  argocd_namespace = var.cpd_operators_namespace_argocd_namespace
  ci = var.cpd_operators_namespace_ci
  create_operator_group = var.cpd_operators_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.cpd_operators_namespace
  server_name = module.gitops_repo.server_name
}
module "gitops_repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops?ref=v1.21.0"

  branch = var.gitops_repo_branch
  debug = var.debug
  gitea_host = var.gitops_repo_gitea_host
  gitea_org = var.gitops_repo_gitea_org
  gitea_token = var.gitops_repo_gitea_token
  gitea_username = var.gitops_repo_gitea_username
  gitops_namespace = var.gitops_repo_gitops_namespace
  host = var.gitops_repo_host
  org = var.gitops_repo_org
  project = var.gitops_repo_project
  public = var.gitops_repo_public
  repo = var.gitops_repo_repo
  sealed_secrets_cert = var.gitops_repo_sealed_secrets_cert
  server_name = var.gitops_repo_server_name
  strict = var.gitops_repo_strict
  token = var.gitops_repo_token
  type = var.gitops_repo_type
  username = var.gitops_repo_username
}
module "gitops-cp-catalogs" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp-catalogs?ref=v1.2.4"

  entitlement_key = var.entitlement_key
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = var.gitops-cp-catalogs_namespace
  server_name = module.gitops_repo.server_name
}
module "gitops-cp4d-operator" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp4d-operator?ref=v1.0.0"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.cpd_operators_namespace.name
  server_name = module.gitops_repo.server_name
}
module "ibm_common_services_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.12.0"

  argocd_namespace = var.ibm_common_services_namespace_argocd_namespace
  ci = var.ibm_common_services_namespace_ci
  create_operator_group = var.ibm_common_services_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.ibm_common_services_namespace
  server_name = module.gitops_repo.server_name
}
module "util-clis" {
  source = "cloud-native-toolkit/clis/util"
  version = "1.16.9"

  bin_dir = var.util-clis_bin_dir
  clis = var.util-clis_clis == null ? null : jsondecode(var.util-clis_clis)
}
