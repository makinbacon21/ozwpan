#!/bin/bash
# uninstall-dkms.sh

DRIVER_NAME="ozwpan"
DRIVER_VERSION="1.0"

# Remove from DKMS
sudo dkms remove -m ${DRIVER_NAME} -v ${DRIVER_VERSION} --all

# Remove source directory
sudo rm -rf /usr/src/${DRIVER_NAME}-${DRIVER_VERSION}

echo "DKMS uninstallation complete!"
