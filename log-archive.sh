#!/bin/bash

##
## PERSONAL PROJECT, 2026
## log-archive-tool
## File description:
## log-archive
##

echo -e "Welcome to the log-archive tool !\n"

if [[ $# -lt 1 ]]; then
    echo -e "\033[32mRun the script with a log directory !\033[0m"
    exit 1
else
    if [[ -d $1 ]]; then
        echo -e "Yes directory provided as argument exist.\n"
        zip_date=$(date "+%Y%m%d_%H%M%S")
        if [[ -d "./archives" ]]; then
            tar -czf logs_archive_${zip_date}.tar.gz $1
            mv logs_archive_${zip_date}.tar.gz ./archives
        else
            mkdir ./archives
            tar -czf logs_archive_${zip_date}.tar.gz $1
            mv logs_archive_${zip_date}.tar.gz ./archives
        fi
    else
        echo -e "Nope directory doesn't exist. Enter a valid directory path !\n"
        exit 1
    fi
fi
