FROM osrm/osrm-backend

COPY entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

COPY configure-orsm-routing.sh /tmp/
RUN chmod +x /tmp/configure-orsm-routing.sh

RUN apt-get update && apt-get install procps -y

#Needed for each profile
COPY Leipzig.osm.pbf /data/pollution-profile/
COPY Bike_Pollution/pollution.lua /data/pollution-profile/profile.lua
COPY Bike_Pollution/json.lua /data/pollution-profile
COPY Bike_Pollution/all_data_pollution.json /data/pollution-profile
COPY Bike_Pollution/leipzig_bikenet.json /data/pollution-profile

#Needed for each profile
COPY Leipzig.osm.pbf /data/shortest-profile/
COPY Bike_Shortest/bike.lua /data/shortest-profile/profile.lua

ENTRYPOINT /tmp/entrypoint.sh
