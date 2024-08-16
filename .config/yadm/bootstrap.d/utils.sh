#!/bin/bash

set -e

install_package() {
    # Check if package is already installed
    sudo dpkg -l | grep -qw "$1"

    if [ $? ]; then
        echo "'$1' already installed. Skipping"
    else
        echo "'$1' not installed. Installing..."
        sudo apt-get install -y $1 --no-recommends
    fi
}