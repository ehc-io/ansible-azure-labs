#!/bin/bash
docker run -it --name azure-ansible -v $HOME/devops/f5/github/ansible-azure-labs/playbooks:/root/azure \
eduardoc/f5-ansible-container:azure