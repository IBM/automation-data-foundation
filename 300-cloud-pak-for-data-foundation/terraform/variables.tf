variable "deployer_storage_class" {
  type = string
  description = "Storage class to be used by the cloud pak deployer"
  default = "ocs-storagecluster-cephfs"
}
variable "gitops-cp4d-deployer_instance_namespace" {
  type = string
  description = "The namespace where the cloud pak deployer job will be deployed"
  default = "cpd-instance"
}
variable "cluster_name" {
  type = string
  description = "The namespace where the cloud pak deployer will be deployed"
}
variable "cluster_ingress" {
  type = string
  description = "The ingress subdomain for the cluster"
}
variable "cpd_version" {
  type = string
  description = "The CP4D version to deploy."
}
variable "entitlement_key" {
  type = string
  description = "The Cloud Pak entitlement key"
}
variable "gitops-cp4d-deployer_sequential_install" {
  type = bool
  description = "Deploy in sequence.  Default is parallel deployment"
  default = false
}
variable "install_scheduler" {
  type = bool
  description = "Install scheduler cartridge"
}
variable "install_analyticsengine" {
  type = bool
  description = "Install Analytics Engine cartridge"
}
variable "install_bigsql" {
  type = bool
  description = "Install bigsql cartridge"
}
variable "install_ca" {
  type = bool
  description = "Install ca cartridge"
}
variable "install_cde" {
  type = bool
  description = "Install cde cartridge"
}
variable "install_datagate" {
  type = bool
  description = "Install datagate cartridge"
}
variable "install_datastage-ent-plus" {
  type = bool
  description = "Install datastage-ent-plus cartridge"
}
variable "install_db2" {
  type = bool
  description = "Install db2 cartridge"
}
variable "install_db2u" {
  type = bool
  description = "Install db2u cartridge"
}
variable "install_db2wh" {
  type = bool
  description = "Install db2wh cartridge"
}
variable "install_dmc" {
  type = bool
  description = "Install dmc cartridge"
}
variable "install_dods" {
  type = bool
  description = "Install dods cartridge"
}
variable "install_dp" {
  type = bool
  description = "Install dp cartridge"
}
variable "install_dv" {
  type = bool
  description = "Install dv cartridge"
}
variable "install_hadoop" {
  type = bool
  description = "Install hadoop cartridge"
}
variable "install_mdm" {
  type = bool
  description = "Install mdm cartridge"
}
variable "install_openpages" {
  type = bool
  description = "Install openpages cartridge"
}
variable "install_planning-analytics" {
  type = bool
  description = "Install planning-analytics cartridge"
}
variable "install_rstudio" {
  type = bool
  description = "Install rstudio cartridge"
}
variable "install_spss" {
  type = bool
  description = "Install spss cartridge"
}
variable "install_voice-gateway" {
  type = bool
  description = "Install voice-gateway cartridge"
}
variable "install_watson-assistant" {
  type = bool
  description = "Install watson-assistant cartridge"
}
variable "install_watson-discovery" {
  type = bool
  description = "Install watson-discovery cartridge"
}
variable "install_watson-ks" {
  type = bool
  description = "Install watson-ks cartridge"
}
variable "install_watson-openscale" {
  type = bool
  description = "Install watson-openscale cartridge"
}
variable "install_watson-speech" {
  type = bool
  description = "Install watson-speech cartridge"
}
variable "install_wkc" {
  type = bool
  description = "Install wkc cartridge"
}
variable "install_wml" {
  type = bool
  description = "Install wml cartridge"
}
variable "install_wml-accelerator" {
  type = bool
  description = "Install wml-accelerator cartridge"
}
variable "install_wsl" {
  type = bool
  description = "Install wsl cartridge"
}
variable "gitops_default_host" {
  type = string
  description = "the value of gitops_default_host"
  default = ""
}
variable "gitops_default_org" {
  type = string
  description = "the value of gitops_default_org"
  default = ""
}
variable "gitops_default_username" {
  type = string
  description = "the value of gitops_default_username"
  default = ""
}
variable "gitops_default_token" {
  type = string
  description = "the value of gitops_default_token"
  default = ""
}
variable "gitops_default_ca_cert" {
  type = string
  description = "the value of gitops_default_ca_cert"
  default = ""
}
variable "gitops_host" {
  type = string
  description = "The host name of the gitops repository (GitHub, Github Enterprise, Gitlab, Bitbucket, Azure DevOps, and Gitea servers are supported)."
  default = ""
}
variable "gitops_org" {
  type = string
  description = "The organization on the git server where the repsitory will be located. If not provided the org will default to the username."
  default = ""
}
variable "gitops_project" {
  type = string
  description = "The Azure DevOps project in the git server. This value is only applied for Azure DevOps servers."
  default = ""
}
variable "gitops_repo" {
  type = string
  description = "The name of the repository in the org on the git server."
  default = ""
}
variable "gitops_username" {
  type = string
  description = "The username used to access the git server."
  default = ""
}
variable "gitops_token" {
  type = string
  description = "The token used to access the git server."
  default = ""
}
variable "gitops_branch" {
  type = string
  description = "The name of the branch in the gitops repository where the config will be stored."
  default = "main"
}
variable "gitops_server_name" {
  type = string
  description = "The name of the server the configuration with which the configuration will be associated."
  default = "default"
}
variable "gitops_ca_cert" {
  type = string
  description = "The ca certificate used to sign the self-signed certificate used by the git server, if applicable."
  default = ""
}
variable "gitops_ca_cert_file" {
  type = string
  description = "The file containing the ca certificate used to sign the self-signed certificate used by the git server, if applicable."
  default = ""
}
variable "cloud_pak_deployer_namespace" {
  type = string
  description = "The value that should be used for the namespace"
  default = "cloud-pak-deployer"
}
variable "cloud_pak_deployer_namespace_ci" {
  type = bool
  description = "Flag indicating that this namespace will be used for development (e.g. configmaps and secrets)"
  default = false
}
variable "cloud_pak_deployer_namespace_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "cloud_pak_deployer_namespace_argocd_namespace" {
  type = string
  description = "The namespace where argocd has been deployed"
  default = "openshift-gitops"
}
variable "cloud_pak_deployer_namespace_branch" {
  type = string
  description = "The branch in the gitops repo where the resources should be placed"
  default = "main"
}
variable "cpd_instance_namespace" {
  type = string
  description = "The value that should be used for the namespace"
  default = "cpd-instance"
}
variable "cpd_instance_namespace_ci" {
  type = bool
  description = "Flag indicating that this namespace will be used for development (e.g. configmaps and secrets)"
  default = false
}
variable "cpd_instance_namespace_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "cpd_instance_namespace_argocd_namespace" {
  type = string
  description = "The namespace where argocd has been deployed"
  default = "openshift-gitops"
}
variable "cpd_instance_namespace_branch" {
  type = string
  description = "The branch in the gitops repo where the resources should be placed"
  default = "main"
}
variable "gitops_repo_host" {
  type = string
  description = "The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used."
  default = ""
}
variable "gitops_repo_type" {
  type = string
  description = "[Deprecated] The type of the hosted git repository."
  default = ""
}
variable "gitops_repo_org" {
  type = string
  description = "The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used."
  default = ""
}
variable "gitops_repo_project" {
  type = string
  description = "The project that will be used for the git repo. (Primarily used for Azure DevOps repos)"
  default = ""
}
variable "gitops_repo_username" {
  type = string
  description = "The username of the user with access to the repository"
  default = ""
}
variable "gitops_repo_token" {
  type = string
  description = "The personal access token used to access the repository"
  default = ""
}
variable "gitops_repo_gitea_host" {
  type = string
  description = "The host for the default gitea repository."
  default = ""
}
variable "gitops_repo_gitea_org" {
  type = string
  description = "The org/group for the default gitea repository. If not provided, the value will default to the username org"
  default = ""
}
variable "gitops_repo_gitea_username" {
  type = string
  description = "The username of the default gitea repository"
  default = ""
}
variable "gitops_repo_gitea_token" {
  type = string
  description = "The personal access token used to access the repository"
  default = ""
}
variable "gitops_repo_repo" {
  type = string
  description = "The short name of the repository (i.e. the part after the org/group name)"
}
variable "gitops_repo_branch" {
  type = string
  description = "The name of the branch that will be used. If the repo already exists (provision=false) then it is assumed this branch already exists as well"
  default = "main"
}
variable "gitops_repo_public" {
  type = bool
  description = "Flag indicating that the repo should be public or private"
  default = false
}
variable "gitops_repo_gitops_namespace" {
  type = string
  description = "The namespace where ArgoCD is running in the cluster"
  default = "openshift-gitops"
}
variable "gitops_repo_server_name" {
  type = string
  description = "The name of the cluster that will be configured via gitops. This is used to separate the config by cluster"
  default = "default"
}
variable "gitops_repo_sealed_secrets_cert" {
  type = string
  description = "The certificate/public key used to encrypt the sealed secrets"
  default = ""
}
variable "gitops_repo_strict" {
  type = bool
  description = "Flag indicating that an error should be thrown if the repo already exists"
  default = false
}
variable "debug" {
  type = bool
  description = "Flag indicating that debug loggging should be enabled"
  default = false
}
variable "util-clis_bin_dir" {
  type = string
  description = "The directory where the clis should be downloaded. If not provided will default to ./bin"
  default = ""
}
variable "util-clis_clis" {
  type = string
  description = "The list of clis that should be made available in the bin directory. Supported values are yq, jq, igc, helm, argocd, rosa, gh, glab, and kubeseal. (If not provided the list will default to yq, jq, and igc)"
  default = "[\"yq\",\"jq\",\"igc\"]"
}
