#!/bin/bash

if [ -z "$3" ]; then
	read -p "Enter repository name: " name
else
	name=$
fi

rm -rf "./../../$config_repositories_local/$name"
