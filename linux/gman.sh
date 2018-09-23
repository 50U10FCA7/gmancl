#!/bin/bash

if [ -z "$1" ]; then
	read -p "Enter library name: " library
else
	library=$1
fi

if [ -z "$2" ]; then
	echo "hello world"
	read -p "Enter script name: " script
else
	script=$2
fi



#config
config_user="username"
config_ip='127.0.0.1'
config_port="1337"
config_repositories_remote="home/username/gman_repositories"
config_repositories_local="repositories"
#config_repositories_remote - sets without '/' at start and end
#config_repositories_local - sets without '/' at start and end, locals from gmancl directory



cd $library
source $script.sh
cd ..
