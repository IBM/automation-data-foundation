# Cloud Pak for Data, db2oltp Subscription and Db2oltpService instance gitops module

Module to provision a gitops repo with the resources necessary to provision a Cloud Pak for data,ibm-db2oltp-cp4d-operator Subscription and Db2oltpService instance on a cluster. In order to provision Subscription and the instance, the following steps are performed:

1. Add the db2oltp Subscription chart to the gitops repo (charts/ibm-cpd-db2-subscription)
2. Add the Db2oltpService instance chart to the gitops repo (charts/ibm-cpd-db2-instance)

Unit tests is expected to be executed on a cluster that already has CP4D-instance and its dependencies installed and configured.



## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - > v0.15

### Terraform providers

none

## Module dependencies

This module makes use of the output from other modules:

- GitOps - github.com/cloud-native-toolkit/terraform-tools-gitops.git
- Namespace - github.com/cloud-native-toolkit/terraform-gitops-namespace.git
- gitops_ibm_catalogs - github.com/cloud-native-toolkit/terraform-gitops-cp-catalogs.git
- gitops_cp_foundation - github.com/cloud-native-toolkit/terraform-gitops-cp-foundational-services.git
- gitops_cp4d_operator - github.com/cloud-native-toolkit/terraform-gitops-cp4d-operator.git
- gitops-cp4d-instance - github.com/cloud-native-toolkit/terraform-gitops-cp4d-instance.git
- gitops-db2 - github.com/cloud-native-toolkit/terraform-gitops-db2u-operator.git

## Example usage

```hcl-terraform
module "cp-db2" {
  depends_on = [module.gitops-db2]
  source = "github.com/cloud-native-toolkit/terraform-gitops-db2-instance.git"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = module.gitops_namespace.name
  kubeseal_cert = module.gitops.sealed_secrets_cert
  operator_namespace= "cpd-operators"  
  cpd_namespace = "gitops-cp4d-instance" 
}
```