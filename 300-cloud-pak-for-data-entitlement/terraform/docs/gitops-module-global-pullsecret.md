# Starter kit for a Terraform GitOps module

This is a gitops module that will append container registry credentials to the global pull secrets of an OpenShift Cluster.

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
module "global_sealed_secrets" {
   source = "github.com/cloud-native-toolkit/terraform-gitops-global-pullsecret.git"

   gitops_config = module.gitops.gitops_config
   git_credentials = module.gitops.git_credentials
   server_name = module.gitops.server_name
   namespace = module.gitops_namespace.name
   kubeseal_cert = module.gitops.sealed_secrets_cert

   docker_server = "cp.icr.io"
   docker_username = "cp"
   secret_name = "cp-credentials"
   docker_password = "mypassword"
}
```

- `docker_server` - the registry whose credentials will be added
- `docker_username` - the user to be logged in
- `docker_password` - the password to log in
- `secret_name` - the secret where credentials will be stored until they're added to global pull secrets