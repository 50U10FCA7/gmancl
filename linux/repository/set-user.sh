#!/bin/bash

if [ -z "$3" ]; then
	read -p "Enter repository name: " name
else
	name=$3
fi

if [ -z "$4" ]; then
	read -p "Enter repository remote user: " user
else
	user=$4
fi

directory="./../../$config_repositories_local/$name"
cd $directory

git remote remove origin
git remote add origin "ssh://$user@$config_ip:$config_port/$config_repositories_remote/$name.git"
read
