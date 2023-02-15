module "cloud_pak_deployer_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.15.0"

  argocd_namespace = var.cloud_pak_deployer_namespace_argocd_namespace
  branch = var.cloud_pak_deployer_namespace_branch
  ci = var.cloud_pak_deployer_namespace_ci
  create_operator_group = var.cloud_pak_deployer_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.cloud_pak_deployer_namespace
  server_name = module.gitops_repo.server_name
}
module "cpd_instance_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.15.0"

  argocd_namespace = var.cpd_instance_namespace_argocd_namespace
  branch = var.cpd_instance_namespace_branch
  ci = var.cpd_instance_namespace_ci
  create_operator_group = var.cpd_instance_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.cpd_instance_namespace
  server_name = module.gitops_repo.server_name
}
module "gitops_repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops?ref=v1.23.3"

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
module "gitops-cp4d-deployer" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp4d-deployer?ref=v0.0.6"

  cluster_ingress = var.cluster_ingress
  cluster_name = var.cluster_name
  cpd_version = var.cpd_version
  deployer_storage_class = var.deployer_storage_class
  entitlement_key = var.entitlement_key
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  install_analyticsengine = var.install_analyticsengine
  install_bigsql = var.install_bigsql
  install_ca = var.install_ca
  install_cde = var.install_cde
  install_datagate = var.install_datagate
  install_datastage-ent-plus = var.install_datastage-ent-plus
  install_db2 = var.install_db2
  install_db2u = var.install_db2u
  install_db2wh = var.install_db2wh
  install_dmc = var.install_dmc
  install_dods = var.install_dods
  install_dp = var.install_dp
  install_dv = var.install_dv
  install_hadoop = var.install_hadoop
  install_mdm = var.install_mdm
  install_openpages = var.install_openpages
  install_planning-analytics = var.install_planning-analytics
  install_rstudio = var.install_rstudio
  install_scheduler = var.install_scheduler
  install_spss = var.install_spss
  install_voice-gateway = var.install_voice-gateway
  install_watson-assistant = var.install_watson-assistant
  install_watson-discovery = var.install_watson-discovery
  install_watson-ks = var.install_watson-ks
  install_watson-openscale = var.install_watson-openscale
  install_watson-speech = var.install_watson-speech
  install_wkc = var.install_wkc
  install_wml = var.install_wml
  install_wml-accelerator = var.install_wml-accelerator
  install_wsl = var.install_wsl
  instance_namespace = var.gitops-cp4d-deployer_instance_namespace
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.cloud_pak_deployer_namespace.name
  sequential_install = var.gitops-cp4d-deployer_sequential_install
  server_name = module.gitops_repo.server_name
}
module "util-clis" {
  source = "cloud-native-toolkit/clis/util"
  version = "1.18.2"

  bin_dir = var.util-clis_bin_dir
  clis = var.util-clis_clis == null ? null : jsondecode(var.util-clis_clis)
}
