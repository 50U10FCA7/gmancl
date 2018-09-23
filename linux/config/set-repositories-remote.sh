#!/bin/bash

if [ -z "$3" ]; then
	read -p "Enter remote repositories path: " repositories_remote
else
	repositories_remote=$3
fi

repositories="./../../$config_repositories_local"
cd $repositories
for repository in */; do
	name=`basename $repository`

	if [ -f $repository ]; then
		cd $repository

		git remote remove origin
		git remote add origin "ssh://$username@$config_ip:$config_port/$repositories_remote/$name.git"

		cd $repositories
	fi
done

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 22 "config_repositories_remote='$repositories_remote'"
