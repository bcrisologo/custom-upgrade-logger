# Custom-upgrade-package-logger

A simple logger script for the packages to be updated in your system if you have a scheduled time for performing manual upgrades on your server and need to perform a record of each manual update.

The script will do a dry run for listing the packages to be upgraded and removed as seen on the terminal.  It will include the date and time of when the script was run and what packages are to be upgraded and removed.  A sample output of this script is as seen below:
```
06/23/20 17:37:21:
The following packages need to be UPGRADED:
apport containerd.io distro-info-data dmeventd dmsetup docker-ce
docker-ce-cli kmod libdevmapper-event1.02.1 libdevmapper1.02.1 libdrm-common
libdrm2 libkmod2 liblvm2app2.2 liblvm2cmd2.02 libnss-systemd libpam-systemd
libsystemd0 libudev1 lvm2 lxcfs nplan open-iscsi open-vm-tools
python-apt-common python3-apport python3-apt python3-problem-report
python3-software-properties python3-update-manager
software-properties-common sosreport systemd systemd-sysv udev
update-manager-core zabbix-agent zabbix-frontend-php zabbix-server-mysql

The following needs to be REMOVED:
linux-headers-4.15.0-20 linux-headers-4.15.0-20-generic
linux-image-4.15.0-20-generic linux-modules-4.15.0-20-generic
linux-modules-extra-4.15.0-20-generic
```
The default location for the logged packages to be installed and removed is at ```/var/log/upgrades-script.log```.  You can change this to any location you desire.

## Notes:
Please take note of the following:
  * You need to ensure that the script is executable (chmod)
  * You need to run this as ```root``` user due to permissions required to run ```apt-get``` and accessing ```/var/log``` directory
  * You can have the root cron to run this periodically so it records the packages at a rate you desire.  You can learn how to [edit the crontab with this reference](https://askubuntu.com/questions/419548/how-to-set-up-a-root-cron-job-properly)
  * If there are empty packages for either apt-get commands, it will give a blank after each "The following..."
  * The script will move to the new line every update and not overwrite the whole file every time the script is ran

## Disclaimers: 
Please note the following disclaimers:
  * This was tested on Ubuntu 18.04 LTS Desktop and Server.  Use as you see fit.
  * If you remove '-s' on the ```apt-get``` commands, the upgrade will perform, but the autoremove will return with error pipeline.  Advise not to use this for production run and utilize [unattended-upgrades package installer](https://help.ubuntu.com/community/AutomaticSecurityUpdates) instead.
