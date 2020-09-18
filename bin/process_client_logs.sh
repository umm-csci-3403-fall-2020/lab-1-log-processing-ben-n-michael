#! /usr/bin/env bash

client=$1

cd "$client" || exit
cat var/log/* > combined.txt


awk -F "[: ]+" '/Failed password for invalid user|Failed password for/{print  $1,$2,$3,$(NF-5),$(NF-3)}' combined.txt > failed_login_data.txt
