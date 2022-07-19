FROM osrm/osrm-backend

COPY entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh

COPY configure-orsm-routing.sh /tmp/
RUN chmod +x /tmp/configure-orsm-routing.sh

RUN apt-get update && apt-get install procps -y

#Needed for each profile
COPY Leipzig.osm.pbf /tmp/data/pollution-profile/
COPY Bike_Pollution/pollution.lua /tmp/data/pollution-profile/profile.lua
COPY Bike_Pollution/json.lua /tmp/data/pollution-profile
COPY Bike_Pollution/all_data_pollution.json /tmp/data/pollution-profile
COPY Bike_Pollution/leipzig_bikenet.json /tmp/data/pollution-profile

#Needed for each profile
COPY Leipzig.osm.pbf /tmp/data/shortest-profile/
COPY Bike_Shortest/bike.lua /tmp/data/shortest-profile/profile.lua

ENTRYPOINT /tmp/entrypoint.sh
