#!/usr/bin/env bash

if [ "${INSTALL_WKHTMLTOPDF}" == "yes" ]; then
    echo "$(tput setaf 7)================================================================================"
    echo "$(tput setaf 1) $(tput setab 7)wkhtmltopdf installation started ...$(tput sgr 0)"
    echo "$(tput setaf 7)================================================================================"

    if [ "${WKHTMLTOPDF_VERSION}" == "latest"  ]; then
        wget -q https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
        unxz wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
        tar -xf wkhtmltox-0.12.4_linux-generic-amd64.tar
        mv wkhtmltox/bin/* /usr/bin/
        rm -rf wkhtmltox
        rm -f wkhtmltox-0.12.4_linux-generic-amd64.tar
    else
        wget -q https://github.com/wkhtmltopdf/obsolete-downloads/releases/download/linux/wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2
        tar -xvjf wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2
        mv wkhtmltopdf-amd64 wkhtmltopdf
        mv wkhtmltopdf /usr/bin
        rm wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2
    fi

    which wkhtmltopdf

    echo "$(tput setaf 7)================================================================================"
    echo "$(tput setaf 1) $(tput setab 7)wkhtmltopdf installation finished ...$(tput sgr 0)"
    echo "$(tput setaf 7)================================================================================"
fi
