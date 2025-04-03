# Shiranui
My personal self-hosted infrastructure as code using Ansible.

## Overview
You'll find here my code to deploy a Kubernetes (K3s) cluster on a Turing Pi 2.5 with every app needed to comply with the architecture. 

## Requirements
For a simple deployment:
- Ansible 11.3.0 [core 2.18.3]

For testing purposes:
- Vagrant 2.4.3 
- VirtualBox 7.1.x

## Architecture
Here is the global network architecture I am going to set up, simplified and with the most relevant services.  
This is architecture expose applications to the internet with restricted access.  

> Insert logical architecture image

All services will be accessible via dedicated subdomains, Traefik will be responsible for routing the request to the right application running in Kubernetes.

## Wiki
For more information about the infrastructure and deployment, check out the Wiki.
