#!/bin/bash

#resize disk from 20GB to 50GB
growpart /dev/nvme0n1 4

lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -L +10G /dev/mapper/RootVG-rootVol
lvextend -l +100%FREE /dev/mapper/RootVG-homeVol

xfs_growfs /
xfs_growfs /var
xfs_growfs /home

# This is mandatory, nodejs installtion will break SSH if we dont update these packages
dnf update -y openssl\* openssh\* -y

yum install fontconfig java-21-openjdk -y

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y