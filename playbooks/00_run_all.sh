#!/bin/bash
ansible-playbook ./01_deploy_ubuntu_1804_LTS.yaml
ansible-playbook ./02_deploy_bigip_1nic.yaml
ansible-playbook ./03_update_security_group.yaml
ansible-playbook -i ./azure_hosts ./04_deploy_vs.yaml
echo ""