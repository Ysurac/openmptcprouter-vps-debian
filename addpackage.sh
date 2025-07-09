#!/bin/sh
# Packages & Packages.gz
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

# Release, Release.gpg & InRelease
apt-ftparchive release . > Release
gpg -abs -o - Release > Release.gpg
gpg --clearsign -o - Release > InRelease

# Commit & push
#git add -A
#git commit -m update
#git push