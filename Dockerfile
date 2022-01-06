FROM quay.io/ansible/awx-ee:latest

USER root
RUN dnf install -y https://harbottle.gitlab.io/harbottle-main/8/x86_64/harbottle-main-release.rpm
RUN dnf install -y sops

USER 1000
