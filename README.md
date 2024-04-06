# CPRIME - DEVOPS - EXERCISE
# Repository Overview
This GitHub repository is structured to facilitate DevOps practices for a sample Python-Flask application. It includes the following components:

- **Sample Python-Flask Application**: Demonstrates containerization by displaying the container name and IP address.
- **Dockerfile**: Provides instructions for building a Docker image of the application.
- **Terraform Scripts**: A collection of scripts to provision an Azure Kubernetes Service (AKS) cluster infrastructure. These scripts are intended for one-time execution.
- **Kubernetes Manifest Files**: Contains the necessary files to deploy the application and its services on AKS.
- **CI/CD Workflow Files**: Located under the .github/workflows directory, these files define the GitHub Actions workflows for continuous integration and continuous deployment of the application:
    - aks_deploy.yaml
    - terraform.yaml
# Sample Application
The sample application is containerized for easy deployment and scaling within Kubernetes environments.

# CI/CD 
![Alt text](cprime_ci_cd.png)

# Sample Web Application
![Alt text](app.png)

# AKS Cluster Creation with Terraform
Terraform scripts for creating the AKS cluster are located in the infra/aks directory. The ci.yaml workflow automates the creation of the AKS cluster and associated resources within the Azure portal.

# Secrets and Variables Settings
The following table outlines the secrets and variables required for the workflows, along with their respective placeholders:

| Secret Name | Secret Value | Comments |
|-------------|--------------|----------|
|ACR_USERNAME|${{ secrets.ACR_USERNAME }}|Azure Container Registry Admin username|
|ACR_PASSWORD|${{ secrets.ACR_PASSWORD }}|Azure Container Registry password|
|AZURE_CREDENTIALS|${{ secrets.AZURE_CREDENTIALS }}|Azure service principal credentials|
|ARM_CLIENT_ID|${{ secrets.ARM_CLIENT_ID }}|Azure service principal client ID|
|ARM_CLIENT_SECRET|${{ secrets.ARM_CLIENT_SECRET }}|Azure service principal client secret|
|ARM_SUBSCRIPTION_ID|${{ secrets.ARM_SUBSCRIPTION_ID }}|Azure subscription ID|
|ARM_TENANT_ID|${{ secrets.ARM_TENANT_ID }}|Azure tenant ID|
# AKS Cluster Creation using Azure CLI
The following commands are used to create and manage the AKS cluster via the Azure CLI:

# Create a Resource Group
```sh
az group create --name cprime-rg --location eastus
```
# Create a Container Registry
```sh
az acr create --resource-group cprime-rg --name cprimecontainerregistry --sku Basic
```
# Create a Kubernetes Cluster
```sh
az aks create --resource-group cprime-rg --name cprime-cluster --node-count 2 --enable-addons monitoring --generate-ssh-keys
```
# Clean Up Resources
```sh
az group delete --name cprime-rg
```
# Access AKS Cluster from Local Machine
```sh
az aks get-credentials --resource-group cprime-rg --name cprime-cluster
```
> Ensure that all placeholders are replaced with actual values before executing the commands or workflows. The repository is designed to streamline the development and operations lifecycle of the sample application through automation and best practices in cloud-native deployment.