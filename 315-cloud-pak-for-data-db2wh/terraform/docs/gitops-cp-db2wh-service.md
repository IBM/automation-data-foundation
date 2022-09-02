# CP4D - DB2 Warehourse Gitops terraform module

### DB2WH Pre-Req

Ensure that a cluster administrator completed the required Pre-installation tasks for your environment. Specifically, verify that a cluster administrator completed the following tasks:

- Cloud Pak for Data is installed. 
- The cluster is configured to pull the Db2 Warehouse software images. 
  - Make sure the global pull secret is applied and worker nodes are replaced.
- The db2u-operator catalog source exists. 
- The db2u-operator operator subscription exists. 

If these tasks are not complete, the Db2 Warehouse installation will fail.

## Db2 Warehouse on Cloud Pak for Data

IBM Db2 Warehouse is an analytics data warehouse that features in-memory data processing and in-database analytics. It is client-managed and optimized for fast and flexible deployment, with automated scaling that supports analytics workloads. 

3 Namespace(s) are used in this module to support special installation

- operator_namespace: cpd-operators
  CP4D Platform operator, DB2WH Operator will be installed on cpd-operators

- common_services_namespace: ibm-common-services
   CP4D foundational services, Operand Deployment Lifecycle manager Operator and IBM zen service will be installed on the ibm-common-service namespace. 

- cpd_namespace: gitops-cp4d-instance
  DB2WH instance will be installed on gitops-cp4d-instance

## Cloud Pak for Data, Db2WH Subscription and Db2WHService instance gitops module

Module to provision a gitops repo with the resources necessary to provision a Cloud Pak for data,ibm-db2WH-cp4d-operator Subscription and Db2WHService instance on a cluster. In order to provision Subscription and the instance, the following steps are performed:

1. As we are using the Specialized installations architecture(where the IBM Cloud Pak foundational services operators and Cloud Pak for Data operators are in separate OpenShift projects), we must edit the IBM Cloud Pak foundational services operand registry to point to the project where the Cloud Pak for Data operators are installed: 
  - Edit the IBM Cloud Pak foundational services operand registry
  - Change the value of the namespace entry for the ibm-db2u-operator. Specify the OpenShift project where the Cloud Pak for Data operators are installed, for example, cpd-operators:
  - Save the changes
2. Add the db2wh Subscription chart to the gitops repo (charts/ibm-cpd-db2wh-subscription)
3. Add the Db2whService instance chart to the gitops repo (charts/ibm-cpd-db2wh-instance)

Unit tests is expected to be executed on a cluster that already has CP4D-instance and its dependencies installed and configured.
  
## Module dependencies

This module makes use of the output from other modules:

- GitOps - github.com/cloud-native-toolkit/terraform-tools-gitops.git
- Namespace - github.com/cloud-native-toolkit/terraform-gitops-namespace.git
- gitops_ibm_catalogs - github.com/cloud-native-toolkit/terraform-gitops-cp-catalogs.git
- gitops_cp_foundation - github.com/cloud-native-toolkit/terraform-gitops-cp-foundational-services.git
- gitops_cp4d_operator - github.com/cloud-native-toolkit/terraform-gitops-cp4d-operator.git
- gitops-cp4d-instance - github.com/cloud-native-toolkit/terraform-gitops-cp4d-instance.git

## Suggested companion modules

The module itself requires some information from the cluster and needs a namespace to be created. The following companion modules can help provide the required information:

- Gitops: github.com/cloud-native-toolkit/terraform-tools-gitops
- Gitops Bootstrap: github.com/cloud-native-toolkit/terraform-util-gitops-bootstrap
- Namespace: github.com/ibm-garage-cloud/terraform-cluster-namespace
- Pull Secret: github.com/cloud-native-toolkit/terraform-gitops-pull-secret
- Cert: github.com/cloud-native-toolkit/terraform-util-sealed-secret-cert
- Cluster: github.com/cloud-native-toolkit/terraform-ocp-login

### DB2WH Service check

Run this CLI and check if the DB2WHService completed.

- oc project gitops-cp4d-instance

- oc get Db2whService db2wh-cr -o jsonpath='{.status.db2whStatus} {"\n"}'
  
Db2 Warehouse is ready when the command returns "Completed".

### DB2WH Service (instance) removal - Finalizer

Run this CLI and remove the finalizer value from the YAML as sometimes DB2WH service getting stuck.

- oc edit db2whservice db2wh-cr -n gitops-cp4d-instance

## Supported platforms

- OCP 4.8.36 

## References:

- [DB2 Warehouse Knowledge Center](https://www.ibm.com/docs/en/cloud-paks/cp-data/4.0?topic=services-db2-warehouse)
  
  