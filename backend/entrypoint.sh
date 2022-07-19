#!/bin/bash
OSM_FILENAME=Leipzig

#Create symlinks for lua packages
mkdir -p /usr/local/share/lua/5.2/
ln -sf /opt/* /usr/local/share/lua/5.2

mv -r /tmp/data/. /data/

mkdir -p /data/pollution-profile
mkdir -p /data/shortest-profile

#Create OSRM files for both profiles and start server
cd /data/pollution-profile
bash /tmp/configure-orsm-routing.sh $OSM_FILENAME 5000

cd /data/shortest-profile
bash /tmp/configure-orsm-routing.sh $OSM_FILENAME 5001

rm -rf /data/pollution-profile/leipzig_bikenet.json
rm -rf /data/pollution-profile/all_data_pollution.json

#68 years
sleep 2147483647
