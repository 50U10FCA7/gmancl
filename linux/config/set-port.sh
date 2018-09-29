#!/bin/bash

if [ -z "$3" ]; then
	read -p "Enter remote port: " port
else
	port=$3
fi

repositories="./../../$config_repositories_local"
cd $repositories
for repository in */; do
	name=`basename $repository`

	if [ -f $repository ]; then
		cd $repository

		git remote remove origin
		git remote add origin "ssh://$config_user@$config_ip:$port/$config_repositories_remote/$name.git"

		cd $repositories
	fi
done

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 21 "config_port=\"$port\""
