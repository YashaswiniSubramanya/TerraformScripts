#!/bin/bash
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade

#install java 11 on amazon linux instance
sudo dnf install java-11-amazon-corretto -y

sudo yum install jenkins -y
sudo systemctl daemon-reload

sudo systemctl enable jenkins
sudo systemctl start jenkins
sleep 20
sudo systemctl status jenkins
    
#cd /var/lib/jenkins/secrets/initialAdminPassword
#cat initialAdminPassword