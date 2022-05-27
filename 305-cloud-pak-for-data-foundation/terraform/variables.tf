variable "cp4d-instance_cpd_operator_namespace" {
  type = string
  description = "The namespace where the application should be deployed"
  default = "cpd-operators"
}
variable "cp4d-instance_cpd_common_services_namespace" {
  type = string
  description = "Namespace for cpd commmon services"
  default = "ibm-common-services"
}
variable "cp4d-instance_cp4d_instance_name" {
  type = string
  description = "CP4D instance name.  Default is ibmcpd-cr"
  default = "ibmcpd-cr"
}
variable "cp4d-instance_license_accept" {
  type = bool
  description = "License acceptance"
  default = true
}
variable "cp4d-instance_license_type" {
  type = string
  description = "License type (Enterprise | Standard)"
  default = "Enterprise"
}
variable "cp4d-instance_storage_vendor" {
  type = string
  description = "Storage vendor for CPD (ocs | portworx | ibm-spectrum-scale-sc | RWX-storage-class)"
  default = "portworx"
}
variable "gitops-cp-catalogs_namespace" {
  type = string
  description = "The namespace where the application should be deployed"
  default = "openshift-marketplace"
}
variable "entitlement_key" {
  type = string
  description = "The entitlement key used to access the CP4I images in the container registry. Visit https://myibm.ibm.com/products-services/containerlibrary to get the key"
}
variable "ibm_common_services_namespace_name" {
  type = string
  description = "The value that should be used for the namespace"
  default = "ibm-common-services"
}
variable "ibm_common_services_namespace_ci" {
  type = bool
  description = "Flag indicating that this namespace will be used for development (e.g. configmaps and secrets)"
  default = false
}
variable "ibm_common_services_namespace_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "ibm_common_services_namespace_argocd_namespace" {
  type = string
  description = "The namespace where argocd has been deployed"
  default = "openshift-gitops"
}
variable "cpd_operators_namespace_name" {
  type = string
  description = "The value that should be used for the namespace"
  default = "cpd-operators"
}
variable "cpd_operators_namespace_ci" {
  type = bool
  description = "Flag indicating that this namespace will be used for development (e.g. configmaps and secrets)"
  default = false
}
variable "cpd_operators_namespace_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "cpd_operators_namespace_argocd_namespace" {
  type = string
  description = "The namespace where argocd has been deployed"
  default = "openshift-gitops"
}
variable "cp4d_namespace_name" {
  type = string
  description = "The value that should be used for the namespace"
  default = "cp4d"
}
variable "cp4d_namespace_ci" {
  type = bool
  description = "Flag indicating that this namespace will be used for development (e.g. configmaps and secrets)"
  default = false
}
variable "cp4d_namespace_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "cp4d_namespace_argocd_namespace" {
  type = string
  description = "The namespace where argocd has been deployed"
  default = "openshift-gitops"
}
variable "gitops_repo_host" {
  type = string
  description = "The host for the git repository."
  default = ""
}
variable "gitops_repo_type" {
  type = string
  description = "[Deprecated] The type of the hosted git repository."
  default = ""
}
variable "gitops_repo_org" {
  type = string
  description = "The org/group where the git repository exists/will be provisioned."
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
  description = "The host for the git repository."
  default = ""
}
variable "gitops_repo_gitea_org" {
  type = string
  description = "The org/group where the git repository exists/will be provisioned."
  default = ""
}
variable "gitops_repo_gitea_username" {
  type = string
  description = "The username of the user with access to the repository"
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
