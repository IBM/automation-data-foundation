# 300-cloud-pak-for-data-foundation

GitOps deployment of Data Foundation for Cloud pak for Data

## Running the automation

There are three different options for how to configure and run the automation:

- Interactive prompts
- Yaml configuration
- Terraform configuration

### Interactive prompts

In this mode, you will be prompted interactively for the variables required to run the automation.

1. Run the `apply.sh` script
2. At each prompt, provide a value for the variable.
3. Once all the variables are collected, you will be asked to apply the automation. Enter `y` to continue or `n` to stop. Either way, the values provided have been collected and written to two sets of files so that next time you can skip the prompts.

The `apply.sh` script will generate credentials.yaml and variables.yaml input files that can be used
for future deployments as well as generating the credentials.auto.tfvars and terraform.tfvars files
used by the terraform. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Yaml configuration

In this mode, you provide the configuration for your instance in yaml configuration files and avoid
the prompts.

1. Copy the variables.template.yaml file to variables.yaml and credentials.template.yaml to credentials.yaml.
2. Provide values for each of the variables in variables.yaml and credentials.yaml.
3. Run `apply.sh --ci` to kick off the automation. You will not be prompted for input variables and the automation will start immediately

The `apply.sh` script will generate the credentials.auto.tfvars and terraform.tfvars files from the
values provided in the yaml files. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Terraform configuration

In situations where you are comfortable working with the terraform directly, you can skip the yaml
configuration files and directly configure the automation with the terraform configuration files.

1. Copy the variables.template.tfvars file and credentials.auto.template.tfvars to variables.tfvars and credentials.auto.tfvars, respectively.
2. Provide values for the different variables in variables.tfvars and credentials.auto.tfvars.
3. Kick off the automation with `apply.sh --ci` or skip the script and run `terragrunt run-all apply --terragrunt-parallelism 1 --terragrunt-non-interactive`

The terraform.tfvars file can be checked in with the terraform templates. However, credentials.auto.tfvars
should be excluded since it contains sensitive information. The credentials.auto.tfvars file should
already be in .gitignore.

## Contents

### Modules

| Name | Description | Version |
|------|-------------|---------|
| [gitops-cp4d-deployer](https://github.com/cloud-native-toolkit/terraform-gitops-cp4d-deployer) | Module to populate a gitops repo with the resources to provision IBM Cloud Pak for Data using the Cloud Pak Deployer | v0.0.2 |
| [gitops-namespace](https://github.com/cloud-native-toolkit/terraform-gitops-namespace) | Module to configure the provisioning of a namespace in a GitOps repo | v1.15.0 |
| [gitops-namespace](https://github.com/cloud-native-toolkit/terraform-gitops-namespace) | Module to configure the provisioning of a namespace in a GitOps repo | v1.15.0 |
| [gitops-repo](https://github.com/cloud-native-toolkit/terraform-tools-gitops) | Module to provision and set up a GitOps repository | v1.23.3 |
| [util-clis](https://github.com/cloud-native-toolkit/terraform-util-clis) | Module to install clis into local bin directory | v1.18.2 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| deployer_storage_class | Storage class to be used by the cloud pak deployer |  | ocs-storagecluster-cephfs |
| cluster_name | The cluster name where the cloud pak deployer will be deployed |  | cloud-pak-for-data |
| cluster_ingress | The ingress subdomain for the cluster |  |  |
| cpd_version | The CP4D version to deploy. |  | 4.5.0 |
| entitlement_key | The Cloud Pak entitlement key |  |  |
| install_scheduler | Install scheduler cartridge |  | false |
| install_analyticsengine | Install analyticsengine cartridge |  | false |
| install_bigsql | Install bigsql cartridge |  | false |
| install_ca | Install ca cartridge |  | false |
| install_cde | Install cde cartridge |  | false |
| install_datagate | Install datagate cartridge |  | false |
| install_datastage-ent-plus | Install datastage-ent-plus cartridge |  | false |
| install_db2 | Install db2 cartridge |  | false |
| install_db2u | Install db2u cartridge |  | false |
| install_db2wh | Install db2wh cartridge |  | false |
| install_dmc | Install dmc cartridge |  | false |
| install_dods | Install dods cartridge |  | false |
| install_dp | Install dp cartridge |  | false |
| install_dv | Install dv cartridge |  | false |
| install_hadoop | Install hadoop cartridge |  | false |
| install_mdm | Install mdm cartridge |  | false |
| install_openpages | Install openpages cartridge |  | false |
| install_planning-analytics | Install planning-analytics cartridge |  | false |
| install_rstudio | Install rstudio cartridge |  | false |
| install_spss | Install spss cartridge |  | false |
| install_voice-gateway | Install voice-gateway cartridge |  | false |
| install_watson-assistant | Install watson-assistant cartridge |  | false |
| install_watson-discovery | Install watson-discovery cartridge |  | false |
| install_watson-ks | Install watson-ks cartridge |  | false |
| install_watson-openscale | Install watson-openscale cartridge |  | false |
| install_watson-speech | Install watson-speech cartridge |  | false |
| install_wkc | Install wkc cartridge |  | false |
| install_wml | Install wml cartridge |  | false |
| install_wml-accelerator | Install wml-accelerator cartridge |  | false |
| install_wsl | Install wsl cartridge |  | false |
| cloud_pak_deployer_namespace | The value that should be used for the namespace |  | cloud-pak-deployer |
| cpd_instance_namespace | The value that should be used for the namespace |  | cpd-instance |
| gitops_repo_host | The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used. |  |  |
| gitops_repo_org | The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used. |  |  |
| gitops_repo_project | The project that will be used for the git repo. (Primarily used for Azure DevOps repos) |  |  |
| gitops_repo_username | The username of the user with access to the repository |  |  |
| gitops_repo_token | The personal access token used to access the repository | true |  |
| gitops_repo_repo | The short name of the repository (i.e. the part after the org/group name) |  |  |

## Troubleshooting

