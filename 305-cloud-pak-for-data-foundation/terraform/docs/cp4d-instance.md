# gitops-cp4d-instance

This terraform module will create a gitops configuration to deploy an instance of IBM Cloud Pak For Data.
ç
### Command-line tools

- terraform - v0.15
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.5.3
- Helm provider >= 1.1.1 (provided by Terraform)

## Module dependencies

This module makes use of the output from other modules:

- https://github.com/cloud-native-toolkit/terraform-util-sealed-secret-cert
- https://github.com/cloud-native-toolkit/terraform-ocp-login
- https://github.com/cloud-native-toolkit/terraform-util-gitops-bootstrap
- https://github.com/cloud-native-toolkit/terraform-tools-gitops
- https://github.com/cloud-native-toolkit/terraform-gitops-namespace
- https://github.com/cloud-native-toolkit/terraform-gitops-cp-catalogs
- ~~https://github.com/cloud-native-toolkit/terraform-gitops-cp-foundational-services~~
- https://github.com/cloud-native-toolkit/terraform-gitops-cp4d-operator


## Example usage

```hcl-terraform
module "cp4d-instance" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp4d-instance"

  depends_on = [
    module.gitops_cp4d_operator
  ]

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = module.gitops_namespace.name
  cpd_operator_namespace = module.gitops_cpd_operator_namespace.name
  kubeseal_cert = module.gitops.sealed_secrets_cert
}
```