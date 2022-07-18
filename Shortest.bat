set my_path=%cd%
docker run -t -v %my_path%/Bike_Shortest:/data osrm/osrm-backend osrm-extract -p /data/bike.lua /data/Leipzig.osm.pbf --generate-edge-lookup
docker run -t -v %my_path%/Bike_Shortest:/data osrm/osrm-backend osrm-partition /data/Leipzig.osm.pbf
docker run -t -v %my_path%/Bike_Shortest:/data osrm/osrm-backend osrm-customize /data/Leipzig.osm.pbf
docker run -t -i -p 5000:5000 --name=Bike_Shortest -v %my_path%/Bike_Shortest:/data osrm/osrm-backend osrm-routed --algorithm mld /data/Leipzig.osm.pbf