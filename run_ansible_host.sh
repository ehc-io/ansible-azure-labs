#!/bin/bash
#
docker run -it --name azure-ansible -v $PWD/playbooks:/root/azure eduardoc/f5-ansible-container:azure