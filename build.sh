#!/bin/bash

stable=`curl -s "https://api.github.com/repos/blastehh/fiche/releases/latest" | jq -r .tag_name`
if [ -z "${VER}" ] || [ "${VER}" == "latest" ]; then
  DL_VERSION=$stable
else
  DL_VERSION=${VER}
fi

curl -sL "https://api.github.com/repos/blastehh/fiche/tarball/$DL_VERSION" -o fiche.tar.gz
mkdir -p /tmp/fiche
tar -xf fiche.tar.gz --strip-components=1 -C /tmp/fiche
cd /tmp/fiche
make
make install
