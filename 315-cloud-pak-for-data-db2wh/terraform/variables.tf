variable "gitops-cp-db2wh_cluster_ingress_hostname" {
  type = string
  description = "Ingress hostname of the IKS cluster."
  default = ""
}
variable "gitops-cp-db2wh_cluster_type" {
  type = string
  description = "The cluster type (openshift or ocp3 or ocp4 or kubernetes)"
  default = "ocp4"
}
variable "gitops-cp-db2wh_tls_secret_name" {
  type = string
  description = "The name of the secret containing the tls certificate values"
  default = ""
}
variable "gitops-cp-db2wh_subscription_source_namespace" {
  type = string
  description = "The namespace where the catalog has been deployed"
  default = "openshift-marketplace"
}
variable "gitops-cp-db2wh_channel" {
  type = string
  description = "The channel that should be used to deploy the operator"
  default = "v1.0"
}
variable "gitops-cp-db2wh_operator_namespace" {
  type = string
  description = "CPD operator namespace"
  default = "cpd-operators"
}
variable "gitops-cp-db2wh_cpd_namespace" {
  type = string
  description = "CPD namespace"
  default = "cp4d"
}
variable "gitops-cp-db2wh_common_services_namespace" {
  type = string
  description = "Namespace where cpd is deployed"
  default = "ibm-common-services"
}
variable "gitops-cp-db2wh_storage_class" {
  type = string
  description = "Storage class for DB2WH instance"
  default = "portworx-shared-gp3"
}
variable "gitops-cp-db2wh_db2_warehouse_version" {
  type = string
  description = "DB2 Warehouse version"
  default = "4.0.2"
}
variable "gitops-cp-db2wh_db2_warehouse_channel" {
  type = string
  description = "DB2 Warehouse operator subscription channel"
  default = "v1.0"
}
variable "gitops-cp-db2wh_license" {
  type = string
  description = "License type"
  default = "Enterprise"
}
variable "gitops-cp-db2wh_namespace_name" {
  type = string
  description = "The value that should be used for the namespace"
  default = "gitops-cp-db2wh"
}
variable "gitops-cp-db2wh_namespace_ci" {
  type = bool
  description = "Flag indicating that this namespace will be used for development (e.g. configmaps and secrets)"
  default = false
}
variable "gitops-cp-db2wh_namespace_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "gitops-cp-db2wh_namespace_argocd_namespace" {
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
