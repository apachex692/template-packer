#!/bin/bash
#
# Author: InferenceFailed Developers
# Created on: 27/12/2023
cloud-init status --wait

export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get upgrade -y

# TODO: Custom Scripts

# Cleanup
cloud-init clean --logs --machine-id
apt-get autoremove -y --purge
apt-get clean && apt-get autoclean

unset GITHUB_PAT
cloud-init clean --logs --machine-id --seed

rm -r -f /tmp/*
find /var/log -type f -exec truncate -s 0 {} \;
history -c
