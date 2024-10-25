# ArgoCD Application for Node.js Deployment on Minikube

This project demonstrates how to use ArgoCD to pull Kubernetes manifests from a GitHub repository and deploy a Node.js application on a Minikube cluster. The application manifests are stored in the `./manifests` directory of the GitHub repository at https://github.com/Heggoo/nodejs.org.git.

## Prerequisites

Before setting up the ArgoCD application, ensure the following tools and components are installed and configured on your machine:

1. **Docker**: [Install Docker](https://docs.docker.com/get-docker/) to enable building and running containers.
2. **Minikube**: [Install Minikube](https://minikube.sigs.k8s.io/docs/start/) for running a Kubernetes cluster locally.
3. **kubectl**: [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) to manage and interact with your Kubernetes cluster.
4. **ArgoCD on Minikube**: Install ArgoCD on your Minikube cluster by following the [ArgoCD Getting Started Guide](https://argo-cd.readthedocs.io/en/stable/getting_started/).

## Setup Instructions

1.  **Start Minikube**: Ensure Minikube is running.
    ```bash
    minikube start
2. **Install ArgoCD**: Run the following commands to install ArgoCD in a namespace called '''argocd'''.
    ```bash
    kubectl create namespace argocd
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    ```
3. **Expose ArgoCD API Server**: Edit ArgoCD server service called '''argocd-server''' from ClusterIP to be NodePort
     List the services in '''argocd''' namespace
    ```bash
    export KUBE_EDITOR=nano
    kubectl edit -n argocd svc/argocd-server
    minikube service -n argocd list
    ```
    Open the url of '''argocd-server''' service.
4. Login to ArgoCD: Retrieve the initial admin password.
   ```bash
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
   ```

   ![image](https://github.com/user-attachments/assets/18034ce6-13a1-4ddf-92b0-0d4115e38f0b)

   ### Log in using admin as the username and the retrieved password. 
   ### Change your password as you want and save it.

5.  **Create ArgoCD Application**:
     Configure an ArgoCD Application as following Screenshoots that pulls manifests from the GitHub repository and       
     deploys them in Minikube.

   ![Screenshot 2024-10-25 151505](https://github.com/user-attachments/assets/e09a114c-c9ed-4226-9e4b-0c6e05425e03)

   ![Screenshot 2024-10-25 152304](https://github.com/user-attachments/assets/0a8c34b3-aa83-487e-8e83-33c7c4d12cfd)

   And then CLICK Create

6. **Enable Sync**:
    Go for the Applications dashboard and click on your application make sure to hit '''sync''' button then '''Synchronize'''

  ![Screenshot 2024-10-25 152812](https://github.com/user-attachments/assets/fdacd767-f93f-433b-b8f5-3d67603eab0e)

7. **Verify the Application Health**:    
    View the nodejs-app application to see deployment status and resource health.

8. **Access Nodejs Application**:
   ```bash
   minikube service -n nodejsorg list
   ```
   Copy the url of the service and open it in you browser.   
