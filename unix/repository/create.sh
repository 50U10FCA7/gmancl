#!/bin/bash

if [-z "$1"]; then
	read name -p "Enter repository name: "
else
	name=$1
fi

config="./../../config.txt"
readline="./../utils/rline.sh"

config_user=`$readline $config 1`
config_ip=`$readline $config 2`
config_port=`$readline $config 3`
config_repositories_remote=`$readline $config 4`
config_repositories_local=`$readline $config 5`

directory="./../../$config_repositories_local/$name"
if [! -f $directory]; then
	mkdir $directory
fi

cd $directory
read -p "Place repository files in $directory"

git init
git add .
git commit -m "Initial commit"
git remote add origin "ssh://$config_user@$config_ip:$config_port$config_repositories_remote$name.git"
read
