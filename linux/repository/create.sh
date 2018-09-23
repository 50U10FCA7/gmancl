#!/bin/bash

if [ -z "$3" ]; then
	read -p "Enter repository name: " name
else
	name=$
fi

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
