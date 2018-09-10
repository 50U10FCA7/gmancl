#!bin/bash

if [-z "$1"]; then
	read library -p "Enter library name: "
else
	library=$1
fi

if [-z "$2"]; then
	read script -p "Enter script name: "
else
	script=$2
fi

cd $library
bash $script $3 $4 $5 $6 $7
