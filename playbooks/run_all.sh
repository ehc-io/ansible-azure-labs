#!/bin/bash
#
#
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
#
#
SECONDS=0
#
# update IP ACL for management
#
echo '
 __      __  _____  .______________ __________.____       _________ 
/  \    /  \/  _  \ |   \__    ___/ \______   \    |     /   _____/  
\   \/\/   /  /_\  \|   | |    |     |     ___/    |     \_____  \  
 \        /    |    \   | |    |     |    |   |    |___  /        \ 
  \__/\  /\____|__  /___| |____|     |____|   |_______ \/_______  / 
       \/         \/                                  \/        \/ 

'
#

echo -e "Getting public IP..."
MYIP=`curl -s http://ip.42.pl/raw`
echo 
echo $MYIP
#
sed -i 's/<MYIP>/'"$MYIP"'/g' /root/azure/config.yml
#
echo -e "\n${BLUE}TIME:: $(date +"%H:%M")${NC}"
ansible-playbook ./01_deploy_ubuntu_1804_LTS.yaml
#
echo -e "\n${BLUE}TIME:: $(date +"%H:%M")${NC}"
ansible-playbook ./02_deploy_bigip_1nic.yaml
#
echo -e "\n${BLUE}TIME:: $(date +"%H:%M")${NC}"
ansible-playbook ./03_update_security_group.yaml
#
#
sleep 30
echo -e "\n${BLUE}TIME:: $(date +"%H:%M")${NC}"
ansible-playbook -i ./azure_hosts ./04_deploy_vs.yaml
#
echo -e "\n${BLUE}TIME:: $(date +"%H:%M")${NC}"
# total script execution time
echo -e "$(date +'%Y-%d-%m %H:%M'): elapsed time:${RED} $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec${NC}"
#
exit 0