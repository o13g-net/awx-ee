FROM quay.io/ansible/awx-ee:latest

USER root

RUN dnf install -y https://github.com/mozilla/sops/releases/download/v3.7.1/sops-3.7.1-1.x86_64.rpm \
 && dnf clean all

RUN cd /tmp \
 && curl https://get.helm.sh/helm-v3.7.2-linux-amd64.tar.gz --output helm.tar.gz \
 && tar xvzf helm.tar.gz \
 && mv /tmp/linux-amd64/helm /usr/local/bin \
 && chmod +x /usr/local/bin/helm

USER 1000

RUN helm plugin install https://github.com/databus23/helm-diff
