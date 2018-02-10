#!/usr/bin/env bash

if [ "${INSTALL_PDFTK}" == "yes" ]; then
    echo "$(tput setaf 7)================================================================================"
    echo "$(tput setaf 1) $(tput setab 7)pdftk installation started ...$(tput sgr 0)"
    echo "$(tput setaf 7)================================================================================"

    if [ "${PDFTK_VERSION}" == "latest"  ]; then
        wget -q https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk-2.02-1.el6.x86_64.rpm
        yum install -y pdftk-2.02-1.el6.x86_64.rpm
        rm -f pdftk-2.02-1.el6.x86_64.rpm
    else
        wget -q ftp://fr2.rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/pdftk-1.44-2.el6.rf.x86_64.rpm
        rpm -K --nosignature pdftk-1.44-2.el6.rf.x86_64.rpm
        yum install -y jre-gcj
        rpm -Uvh pdftk-1.44-2.el6.rf.x86_64.rpm
        rm -f pdftk-1.44-2.el6.rf.x86_64.rpm
    fi

    which pdftk

    echo "$(tput setaf 7)================================================================================"
    echo "$(tput setaf 1) $(tput setab 7)pdftk installation finished ...$(tput sgr 0)"
    echo "$(tput setaf 7)================================================================================"
fi