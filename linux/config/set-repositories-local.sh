#!/bin/bash

if [ -z "$3" ]; then
	read -p "Enter local repositories path: " repositories_local
else
	repositories_local=$3
fi

repositories="./../../$repositories_local"
config_repositories="./../../$config_repositories_local"

mkdir $repositories
mv $config_repositories"/*" $repositories
rm $repositories

gman="./../gman.sh"
writeline="./../utils/wline.sh"
bash $writeline $gman 23 "config_repositories_local=\"$repositories_local\""
