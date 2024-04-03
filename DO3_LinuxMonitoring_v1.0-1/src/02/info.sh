#!/bin/bash

info () {
    echo "HOSTNAME = $HOSTNAME"
    echo "TIMEZONE = $(cat /etc/timezone) $(date +"UTC %-:::z")"
    echo "USER = $USER"
    echo "OS = $OSTYPE $(awk -F= '$1=="PRETTY_NAME" { print $2 ;}' /etc/os-release)"
    echo "DATE = $(date +"%d %B %Y %T")"
    echo "UPTIME = $(uptime -p)"
    echo "UPTIME_SEC = $(awk '{ print $1 }' /proc/uptime)"
    echo "IP = $(hostname -I | awk '{ print $1 }')"
    echo "MASK = $(netstat -r | tail -n 1 | awk '{ print $3 }')"
    echo "GATEWAY = $(ip route | grep default | awk '{ print $3 }')"
    echo "RAM_TOTAL = $(free | grep "Mem:" | awk '{ printf("%.3f", $2/(1024*1024)) }') GB"
    echo "RAM_USED = $(free | grep "Mem:" | awk '{ printf("%.3f", $3/(1024*1024)) }') GB"
    echo "RAM_FREE = $(free | grep "Mem:" | awk '{ printf("%.3f", $4/(1024*1024)) }') GB"
    echo "SPACE_ROOT = $(df / |  head -2 | tail +2 | awk '{ printf("%.2f", $2/1024) }') MB"
    echo "SPACE_ROOT_USED = $(df / |  head -2 | tail +2 | awk '{ printf("%.2f", $3/1024) }') MB"
    echo "SPACE_ROOT_FREE = $(df / |  head -2 | tail +2 | awk '{ printf("%.2f", $4/1024) }') MB"
}