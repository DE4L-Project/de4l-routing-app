set my_path=%cd%
call docker run -t -v %my_path%/Bike_CSV:/data osrm/osrm-backend osrm-extract -p /data/bike.lua /data/Leipzig.osm.pbf --generate-edge-lookup
call docker run -t -v %my_path%/Bike_CSV:/data osrm/osrm-backend osrm-partition /data/Leipzig.osm.pbf
call docker run -t -v %my_path%/Bike_CSV:/data osrm/osrm-backend osrm-customize /data/Leipzig.osm.pbf --segment-speed-file /data/weight.csv
call docker run -t -i -p 5000:5000 --name=Bike_CSV -v %my_path%/Bike_CSV:/data osrm/osrm-backend osrm-routed --algorithm mld /data/Leipzig.osm.pbf