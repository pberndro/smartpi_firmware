#!/bin/bash

set -e

BOARD_DIR="$(dirname $0)"
BOARD_NAME="$(basename ${BOARD_DIR})"
GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
CONFIG_TXT="${BOARD_DIR}/config-${BOARD_NAME}.txt"

cp -f "${CONFIG_TXT}" ${BINARIES_DIR}/rpi-firmware/config.txt
echo "console=tty1 console=ttyS0,115200" > ${BINARIES_DIR}/rpi-firmware/cmdline.txt

rm -rf "${GENIMAGE_TMP}"
genimage                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
