#!/bin/bash
# get mysql username and password from arguments
while getopts "u:p:" arg;
do
    case "${arg}" in
        u) user=${OPTARG}
           ;;
        p) password=${OPTARG}
           ;;
    esac
done
