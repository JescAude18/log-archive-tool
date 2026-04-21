#!/bin/bash

##
## PERSONAL PROJECT, 2026
## log-archive-tool
## File description:
## log-archive
##

echo -e "\033[32m=========================== LOG ARCHIVE TOOL ===========================\n\033[0m"
echo -e "\033[32m=                   Welcome to the log-archive tool !                  =\n\033[0m"
echo -e "\033[32m========================================================================\n\033[0m"

if [[ $# -ne 1 ]]; then
    echo -e "\033[31mRun the script with only one log directory !\033[0m"
    exit 1
else
    if [[ -d $1 ]]; then
        zip_date=$(date "+%Y%m%d_%H%M%S")
        archive_name="logs_archive_${zip_date}.tar.gz"
        echo "Archiving logs from: $1"
        echo "Archive name: $archive_name"
        mkdir -p ./archives
        tar -czf ./archives/${archive_name} $1
        echo -e "Archive '${archive_name}' created successfully in ./archives directory !\n"
    else
        echo -e "Log directory doesn't exist. Enter a valid log directory path !\n"
        exit 1
    fi
fi
