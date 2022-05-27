# Starter kit for a Terraform GitOps module

This is a gitops module that creates a DaemonSet to periodically read changes in the `pull-secret` secret in the `openshift-config` namespace, and it will write the values (minus those in a blocklist array) to the node's `.docker/config.json`.  This will allow the node to start using new global pull credentials without having to reboot or reload the node.

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v12
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.5.3
- Helm provider >= 1.1.1 (provided by Terraform)

## Module dependencies

This module makes use of the output from other modules:

- GitOps - github.com/cloud-native-toolkit/terraform-tools-gitops.git
- Namespace - github.com/cloud-native-toolkit/terraform-gitops-namespace.git
- etc

## Example usage

```hcl-terraform
module "global_pull_secret_synch" {
   source = "./module"

   gitops_config = module.gitops.gitops_config
   git_credentials = module.gitops.git_credentials
   server_name = module.gitops.server_name
   namespace = module.gitops_namespace.name
   kubeseal_cert = module.gitops.sealed_secrets_cert
}
```