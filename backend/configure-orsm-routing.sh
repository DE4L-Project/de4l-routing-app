#!/bin/bash

OSM_FILENAME=$1
OSRM_PORT=$2

echo "Current working dir: $PWD"
echo "Current port: $OSRM_PORT"
echo "OSM filename: $OSM_FILENAME"

if [[ ! -f "./$OSM_FILENAME.osrm" ]]; then
    osrm-extract -t 8 -p profile.lua "./$OSM_FILENAME.osm.pbf" --generate-edge-lookup
fi

if [[ ! -f "./$OSM_FILENAME.osrm.cells" ]]; then
    osrm-partition "./$OSM_FILENAME.osm.pbf"
fi

if [[ ! -f "./$OSM_FILENAME.osrm.mldgr" ]]; then
    osrm-customize "./$OSM_FILENAME.osm.pbf"
fi

echo "Starting OSRM server in background for $PWD/$OSM_FILENAME.osm.pbf on port $OSRM_PORT"
nohup osrm-routed --algorithm mld --port $OSRM_PORT "./$OSM_FILENAME.osm.pbf" </dev/null &>/dev/null &

### FILE_CREATION_ORDER
#Original
#Leipzig.osm.pbf
#all_data_pollution.json
#leipzig_bikenet.json
#json.lua
#pollution.lua

#After osrm-extract
#Leipzig.osrm.cnbg
#Leipzig.osrm.ebg
#Leipzig.osrm.edges
#Leipzig.osrm.fileIndex
#Leipzig.osrm.icd
#Leipzig.osrm.names
#Leipzig.osrm.properties
#Leipzig.osrm.restrictions
#Leipzig.osrm.tld
#Leipzig.osrm.turn_duration_penalties
#Leipzig.osrm.turn_weight_penalties
#Leipzig.osrm
#Leipzig.osrm.cnbg_to_ebg
#Leipzig.osrm.ebg_nodes
#Leipzig.osrm.enw
#Leipzig.osrm.geometry
#Leipzig.osrm.maneuver_overrides
#Leipzig.osrm.nbg_nodes
#Leipzig.osrm.ramIndex
#Leipzig.osrm.timestamp
#Leipzig.osrm.tls
#Leipzig.osrm.turn_penalties_index

#After osrm-partition
#Leipzig.osrm.cells
#Leipzig.osrm.partition
#Leipzig.osrm.enw (modified)
#Leipzig.osrm.maneuver_overrides (modified)
#Leipzig.osrm.ebg_nodes (modified)
#Leipzig.osrm.fileIndex (modified)
#Leipzig.osrm.cnbg_to_ebg (modified)

#After osrm-customize
#Leipzig.osrm.mldgr
#Leipzig.osrm.cell_metrics
#Leipzig.osrm.datasource_names


