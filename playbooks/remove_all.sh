#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
#
#
SECONDS=0
echo -e "\n${BLUE}TIME:: $(date +"%H:%M")${NC}"
ansible-playbook ./05_remove_rg.yaml
# total script execution time
echo -e "$(date +'%Y-%d-%m %H:%M'): elapsed time:${RED} $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec${NC}"
#
exit 0