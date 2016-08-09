#!/bin/bash
#This script is written by Rffanlab for install Go ENV on linux 
#Script has been tested under CentOS 6
url=$(curl -s https://golang.rffanlab.com/dl/|grep 'https://storage.googleapis.com/golang'|grep 'downloadBox'|grep 'linux'|awk -F'"' '{print $4}')
packageName=$(curl -s https://golang.rffanlab.com/dl/|grep 'https://storage.googleapis.com/golang'|grep 'downloadBox'|grep 'linux'|awk -F'"' '{print $4}'|awk -F'/' '{print $5}')
wget -c $url
mkdir -p /home/GOPATH
tar zxvf $packageName
mv go /usr/local/go
echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile
echo "export GOPATH=/home/GOPATH" >> /etc/profile
echo "export PATH=\$PATH:\$GOPATH/bin" >> /etc/profile
source /etc/profile
