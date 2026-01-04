#!/bin/bash

for xbps_pkg in $(ls -1 ./srcpkgs); do
	if [[ "$xbps_pkg" == "xbps-triggers" ]]; then
		continue
	fi

	if grep -q "restricted=yes" ./srcpkgs/${xbps_pkg}/template; then
		# license :(
		continue
	fi

	./xbps-src pkg -Q ${xbps_pkg} || exit 1
	
	rm -rf masterdir-**/builddir
	./xbps-src clean ${xbps_pkg}
done
