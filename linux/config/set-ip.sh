#!/bin/bash

if [ -z "$3" ]; then
	read -p "Enter remote ip: " ip
else
	ip=$3
fi

repositories="./../../$config_repositories_local"
for repository in $repositories/*/; do
	name=`basename $repository`

	if [[ -f $repository ]]; then
		cd $repository

		git remote remove origin
		git remote add origin "ssh://$config_user@$ip:$config_port$config_repositories_remote$name.git"

		cd $repositories
	fi
done

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 20 "config_ip=\"$ip\""
