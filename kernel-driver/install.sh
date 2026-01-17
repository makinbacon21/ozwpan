#!/bin/bash
# install-dkms.sh

DRIVER_NAME="ozwpan"
DRIVER_VERSION="1.0"
DKMS_DIR="/usr/src/${DRIVER_NAME}-${DRIVER_VERSION}"

# Copy source files to DKMS directory
sudo mkdir -p ${DKMS_DIR}
sudo cp -r * ${DKMS_DIR}/

# Add to DKMS
sudo dkms add -m ${DRIVER_NAME} -v ${DRIVER_VERSION}

# Build the module
sudo dkms build -m ${DRIVER_NAME} -v ${DRIVER_VERSION}

# Install the module
sudo dkms install -m ${DRIVER_NAME} -v ${DRIVER_VERSION}

echo "DKMS installation complete!"
