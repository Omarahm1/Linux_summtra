#!/bin/bash

if [ $# -eq 0 ]; then
	read -p "Enter the directory: " directory
else
	directory=$1
fi

if [ ! -d "$directory" ]
	then
		echo "$directory is not a directory"
		exit 1
fi
for file in "$directory"/*.txt
do
	if [ ! -e "$file" ]
		then
			echo "No .txt files"
			exit 1
	fi
	base_name=$(basename "$file")
	mv "$file" "$directory/old_$base_name"
done
