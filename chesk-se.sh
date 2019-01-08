#!/bin/bash

function enableSE() {
	sed -i 's/SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
}

function ask() {

	echo -en "$1(y/n)? "
	read answer
	if echo "$answer" | grep -iq "^y" ;then
	  echo "$2"
	  $3
	fi

}

selinuxenabled
if [ $? -ne 0 ]
then 
    echo "DISABLED"
    ask "Enable SELinux?" "SELinux will be enabled..." enableSE
    ask "Reboot?" "Computer will be reboot..." reboot
else
    echo "ENABLED"
fi

