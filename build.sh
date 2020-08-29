#!/bin/bash


if [ "$1" = "" ]
then
	echo "Usage : $0 tag"
	exit 1
fi

[ ! -e "Dockerfile" ] && echo "Missing Dockerfile" && exit 2

docker build -t trejeraos/sshd:$1 .

if [ "$2" = "push" ]
then
	docker push trejeraos/sshd:$1
fi
