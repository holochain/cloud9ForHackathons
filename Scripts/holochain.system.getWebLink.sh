#!/usr/bin/env bash
#system.getWebLink.sh

hostname=`hostname`
webHostnameAddress=`echo $hostname | sed 's/\([^-]*\)-\(.*\)-.*/\2.\1/'`

port=8080
[ -z "$1" ] ||  port=$1

echo "http://$webHostnameAddress.c9users.io:$port"
