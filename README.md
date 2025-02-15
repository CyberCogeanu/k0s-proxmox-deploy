## K0S Cluster on Proxmox

This project provides a streamlined approach to deploying and managing a k0s Kubernetes cluster on a Proxmox virtualization environment. It leverages Terraform and Ansible to automate the infrastructure setup and k0s installation.

### Project Description

Deploying Kubernetes on Proxmox offers a robust and scalable solution for containerized applications. k0s, a lightweight and certified Kubernetes distribution, is an ideal choice for Proxmox due to its ease of installation and minimal resource footprint. This project simplifies the process further by automating the deployment and configuration of k0s on Proxmox VMs.

### Features

* Automated deployment of k0s control plane and worker nodes on Proxmox.
* Configuration of networking, storage, and other essential settings.
* Integration with Starboard for Kubernetes security analysis.
* Easy addition of worker nodes for scaling.
* Use of k0sctl for simplified cluster management.

### Architecture

The project utilizes Terraform to provision VMs on Proxmox and Ansible to install and configure k0s on these VMs. The architecture consists of:

* **Proxmox VMs:** These VMs serve as the nodes of the k0s cluster.
* **k0s Control Plane:** The control plane manages the Kubernetes cluster, including scheduling, API access, and cluster state.
* **k0s Worker Nodes:** The worker nodes run the containerized applications.
* **Starboard:** This tool provides security analysis for the Kubernetes cluster.
* **k0sctl:** A command-line tool for managing k0s clusters.

### Setup and Run Instructions

1. **Prerequisites:**
    * Install Terraform - https://github.com/CyberCogeanu/k0s-proxmox-deploy/blob/main/install_Terraform.md
    * Install Ansible
    * Install k0sctl
    * Ensure your Proxmox environment is accessible via SSH.
    * Configure SSH keys for authentication.
2. **Clone the repository:**
    ```bash
    git clone https://gitlab.com/devops-journey5831715/k0s_cluster_proxmox.git
    ```
3. **Update the configuration files:**
    * Modify `cloud-config.yaml` to include your SSH keys.
    * Update `k0sctl.yaml` with the IP addresses of your Proxmox VMs and the desired roles (controller or worker).
4. **Run Terraform:**
    ```bash
    terraform init
    terraform apply
    ```
5. **Run Ansible:**
    ```bash
    ansible-playbook -i inventory main.yml
    ```
6. **Verify the cluster:**
    ```bash
    k0sctl cluster info
    kubectl get nodes
    ```

### Dependencies

* **k0s:** v1.27.1
* **Proxmox:** v7.4
* **Terraform:** v1.4.6
* **Ansible:** v2.14.2

### Networking

The project uses Calico for networking within the k0s cluster. Calico provides flexible network policies and efficient routing.

### Storage

Persistent storage can be provisioned using Proxmox's storage capabilities, such as ZFS or LVM. The project can be extended to automate persistent volume creation.

### Security

* **Starboard:** Integrates security analysis into the deployment process.
* **Secure SSH Configuration:** Uses SSH keys for authentication.
* **Network Policies:** Leverages Calico for network security.

### Troubleshooting and FAQ

* **Q: How do I add worker nodes?**
    * A: Update `k0sctl.yaml` with the new worker node's IP address and run `k0sctl apply`.
* **Q: How do I access the Kubernetes dashboard?**
    * A: Install the Kubernetes dashboard and configure access using kubectl.
* **Q: How do I upgrade k0s?**
    * A: Follow the k0s upgrade instructions and update the Ansible playbook accordingly.

### Project Name Evaluation and Suggestions

The current name, "k0s_cluster_proxmox," is descriptive but could be more concise and professional. Here are some alternatives:

* **k0s-proxmox:** Emphasizes both k0s and Proxmox.
* **proxmox-k0s:** Prioritizes Proxmox.
* **k0s-on-proxmox:** Clearly describes the deployment.
* **k0s-proxmox-cluster:** More comprehensive.

The choice of name depends on the desired emphasis and branding.

### Code Comment Suggestions

* Add comments to the Ansible playbook to explain the purpose of each task.
* Include comments in the Terraform configuration to describe the resources being provisioned.
* Document complex logic or important variables in the scripts.

### Conclusion

This project provides a foundation for deploying and managing k0s clusters on Proxmox. By automating the infrastructure setup and k0s installation, it simplifies the process and allows for easy scaling and maintenance. The integration with Starboard enhances security, and the use of k0sctl provides a user-friendly management interface. With further customization and enhancements, this project can serve as a robust solution for running containerized workloads on Proxmox.