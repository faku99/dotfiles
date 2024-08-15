#!/bin/bash

set -e

install_package() {
    # Check if package is already installed
    sudo dpkg -l | grep -qw "$1"

    if [ $? ]; then
        echo "$1: INSTALLED"
    else
        echo "$1: NOT INSTALLED"
    fi
}