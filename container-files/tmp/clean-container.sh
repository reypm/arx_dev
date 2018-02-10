#!/usr/bin/env bash

echo "$(tput setaf 7)================================================================================"
echo "$(tput setaf 1) $(tput setab 7)Cleaning the house ...$(tput sgr 0)"
echo "$(tput setaf 7)================================================================================"

yum remove php-devel gcc wz --remove-leaves && yum clean all
rm -rf /tmp