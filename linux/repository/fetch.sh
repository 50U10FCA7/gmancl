#!/bin/bash

if [ -z "$3" ]; then
	read -p "Enter repository name: " name
else
	name=$3
fi

git clone "ssh://$config_user@$config_ip:$config_port/$config_repositories_remote/$name.git" "./../../$config_repositories_local/$name"
