# Cloud Pak for Data Operator module

Module to populate a gitops repository with the resources needed to install the Cloud Pak for Data operator.

Installation based on logic here: https://github.com/IBM/cp4d-deployment

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform >= v0.15
- kubectl

### Terraform providers

None

## Module dependencies

This module makes use of the output from other modules:

- GitOps
  - github.com/cloud-native-toolkit/terraform-tools-gitops.git
- ArgoCD Bootstrap
  - github.com/cloud-native-toolkit/terraform-tools-argocd-bootstrap.git
  - github.com/cloud-native-toolkit/terraform-vsi-argocd-bootstrap.git

## Example usage

```hcl-terraform
module "gitops_cp4d_operator" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp4d-operator"

}
```
