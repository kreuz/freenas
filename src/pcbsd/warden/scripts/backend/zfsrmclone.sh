#!/bin/sh
# ZFS functionality
# Args $1 = jail-dir
# Args $2 = zfs directive
#######################################################################

# Source our functions
PROGDIR="/usr/local/share/warden"

# Source our variables
. ${PROGDIR}/scripts/backend/functions.sh

IP="${1}"
CLONE="${2}"

if [ -z "${CLONE}" ] ; then
   echo "ERROR: No clone specified!"
   exit 1
fi

if [ -z "${IP}" ]
then
  echo "ERROR: No jail specified to start!"
  exit 5
fi

if [ -z "${JDIR}" ]
then
  echo "ERROR: JDIR is unset!!!!"
  exit 5
fi

if [ ! -d "${JDIR}/${IP}" ]
then
  echo "ERROR: No jail located at $JDIR/$IP"
  exit 5
fi

rmZFSClone "${JDIR}/${IP}" "${CLONE}" "${IP}"