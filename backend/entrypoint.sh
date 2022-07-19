#!/bin/bash
OSM_FILENAME=Leipzig
BIKENET_FILENAME="leipzig_bikenet.json"
POLLUTION_DATA_FILENAME="all_data_pollution.json"

#Create symlinks for lua packages
mkdir -p /usr/local/share/lua/5.2/
ln -sf /opt/* /usr/local/share/lua/5.2

cp -Rfa /tmp/data/. /data/

mkdir -p /data/pollution-profile
mkdir -p /data/shortest-profile

cd /data/pollution-profile
#Download sensor data from private repo
if [[ ! -f "./$POLLUTION_DATA_FILENAME" ]]; then
  wget --header "Authorization: Basic $GOGS_CREDENTIALS" "$SENSOR_DATA_REPO_URL/$POLLUTION_DATA_FILENAME"
fi

if [[ ! -f "./$BIKENET_FILENAME" ]]; then
  wget --header "Authorization: Basic $GOGS_CREDENTIALS" "$SENSOR_DATA_REPO_URL/$BIKENET_FILENAME"
fi

#Create OSRM files for both profiles and start server
bash /tmp/configure-orsm-routing.sh $OSM_FILENAME 5000

cd /data/shortest-profile
bash /tmp/configure-orsm-routing.sh $OSM_FILENAME 5001

rm -rf /data/pollution-profile/leipzig_bikenet.json
rm -rf /data/pollution-profile/all_data_pollution.json

#68 years
sleep 2147483647
