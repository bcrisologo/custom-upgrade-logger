#!/bin/bash

# Source update
apt-get update

# Upgrading script
date +"%n%m/%d/%y %H:%M:%S:%nThe following packages need to be UPGRADED:" >> /var/log/upgrades-script.log && apt-get -s upgrade | awk 'BEGIN{counter=0} /^The following packages will be upgraded:$/ {counter++; next;} /^[0-9]+ upgraded/ {exit;} counter>0 {gsub(/^ +/, "", $0); print;}' >> /var/log/upgrades-script.log

# Autoremove script
echo -e "\nThe following packages can be REMOVED:" >> /var/log/upgrades-script.log && apt-get -s autoremove | awk 'BEGIN{counter=0} /^The following packages will be REMOVED:$/ {counter++; next;} /^[0-9]+ upgraded/ {exit;} counter>0 {gsub(/^ +/, "", $0); print;}' >> /var/log/upgrades-script.log
