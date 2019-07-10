#!/bin/bash
docker run -it --name azure-ansible -v ./playbooks:/root/azure \
eduardoc/f5-ansible-container:azure