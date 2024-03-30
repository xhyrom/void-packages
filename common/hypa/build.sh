#!/bin/bash

for xbps_pkg in $(ls -1 ./srcpkgs); do
	if [[ "$xbps_pkg" == "xbps-triggers" ]]; then
		continue
	fi

	./xbps-src pkg -Q ${xbps_pkg} || exit 1
done
