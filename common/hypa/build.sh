for xbps_pkg in $(ls -1 ./srcpkgs); do
	./xbps-src pkg -Q ${xbps_pkg} || exit 1
done
