#!/bin/bash

REPOSITORY_DIR=$1
USERNAME=$2
EMAIL=$3

PRIVATE_KEY="private.pem"

xbps-rindex -a ${REPOSITORY_DIR}/*.xbps
xbps-rindex --sign \
	--signedby "${USERNAME} <${EMAIL}>" \
	--privkey ${PRIVATE_KEY} \
	${REPOSITORY_DIR}

for pkg in $(ls -d -1 ${REPOSITORY_DIR}/*.xbps); do
    xbps-rindex --privkey ${PRIVATE_KEY} --sign-pkg ${pkg}
done
