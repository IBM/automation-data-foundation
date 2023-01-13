# CP4D Deployer module

Module to populate a gitops repo with the resources to provision IBM Cloud Pak for Data using the Cloud Pak Deployer


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


- gitops (cloud-native-toolkit/gitops)

### Module dependencies


- gitops - [github.com/cloud-native-toolkit/terraform-tools-gitops.git](https://github.com/cloud-native-toolkit/terraform-tools-gitops.git) (>= 1.1.0)
- namespace - [github.com/cloud-native-toolkit/terraform-gitops-namespace.git](https://github.com/cloud-native-toolkit/terraform-gitops-namespace.git) (>= 1.0.0)

## Example usage

```hcl
module "gitops-cp4d-deployer" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp4d-deployer"

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
  server_name = module.gitops_repo.server_name
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| gitops_config |  | true |  | gitops.gitops_config |
| git_credentials |  | true |  | gitops.git_credentials |
| server_name |  | true |  | gitops.server_name |
| namespace |  | true |  | namespace.name |
| kubeseal_cert |  | true |  | gitops.sealed_secrets_cert |
| deployer_storage_class | Storage class to be used by the cloud pak deployer | false | ocs-storagecluster-cephfs |  |
| instance_namespace | The namespace where the cloud pak deployer instance will be deployed | false | cpd-instance |  |
| cluster_name | The cluster name where the cloud pak deployer will be deployed | true |  |  |
| cluster_ingress | The ingress subdomain for the cluster | true |  |  |
| cpd_version | The CP4D version to deploy. | false | 4.6.0 |  |
| entitlement_key | The Cloud Pak entitlement key | true |  |  |
| install_scheduler | Install scheduler cartridge | true |  |  |
| install_analyticsengine | Install analyticsengine cartridge | true |  |  |
| install_bigsql | Install bigsql cartridge | true |  |  |
| install_ca | Install ca cartridge | true |  |  |
| install_cde | Install cde cartridge | true |  |  |
| install_datagate | Install datagate cartridge | true |  |  |
| install_datastage-ent-plus | Install datastage-ent-plus cartridge | true |  |  |
| install_db2 | Install db2 cartridge | true |  |  |
| install_db2u | Install db2u cartridge | true |  |  |
| install_db2wh | Install db2wh cartridge | true |  |  |
| install_dmc | Install dmc cartridge | true |  |  |
| install_dods | Install dods cartridge | true |  |  |
| install_dp | Install dp cartridge | true |  |  |
| install_dv | Install dv cartridge | true |  |  |
| install_hadoop | Install hadoop cartridge | true |  |  |
| install_mdm | Install mdm cartridge | true |  |  |
| install_openpages | Install openpages cartridge | true |  |  |
| install_planning-analytics | Install planning-analytics cartridge | true |  |  |
| install_rstudio | Install rstudio cartridge | true |  |  |
| install_spss | Install spss cartridge | true |  |  |
| install_voice-gateway | Install voice-gateway cartridge | true |  |  |
| install_watson-assistant | Install watson-assistant cartridge | true |  |  |
| install_watson-discovery | Install watson-discovery cartridge | true |  |  |
| install_watson-ks | Install watson-ks cartridge | true |  |  |
| install_watson-openscale | Install watson-openscale cartridge | true |  |  |
| install_watson-speech | Install watson-speech cartridge | true |  |  |
| install_wkc | Install wkc cartridge | true |  |  |
| install_wml | Install wml cartridge | true |  |  |
| install_wml-accelerator | Install wml-accelerator cartridge | true |  |  |
| install_wsl | Install wsl cartridge | true |  |  |

### Outputs

| Name | Description |
|------|-------------|
| name | The name of the module |
| branch | The branch where the module config has been placed |
| namespace | The namespace where the module will be deployed |
| server_name | The server where the module will be deployed |
| layer | The layer where the module is deployed |
| type | The type of module where the module is deployed |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (3.0.1)
