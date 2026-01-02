#!/bin/bash
yum install fontconfig java-21-openjdk -y

# Install Terraform
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform

# Install Nodejs
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y