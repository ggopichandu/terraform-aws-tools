#!/bin/bash

# Jenkins Installation
curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
yum install fontconfig java-21-openjdk jenkins -y
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins