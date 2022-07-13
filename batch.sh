#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

base_coords="/home/deve/pk/submodules/faster-routes/coords"
base_fr="/home/deve/pk/submodules/faster-routes"

# Copy the unknown spawn point config in
cp ${base_fr}/config_sp_ukn.json ${base_fr}/config.json

/usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${base_coords}/z_utils/sp-westcamparks.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/z_utils/sp-westcamparks.route

/usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${base_coords}/z_utils/sp-craleigh.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_coords}/z_utils/sp-craleigh.route