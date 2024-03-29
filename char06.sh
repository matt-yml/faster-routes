#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

base_coords="/home/deve/devrepo/coords/maps/pk/volumes/rdm/coords"
base_fr="/home/deve/devrepo/coords/submodules/faster-routes"

### charlotte06 spawn points
# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json
# Specify sub directory
area=spawnpoints
# Pick your fence.
fence=sp-char06
cat ${cfg}
echo "area: ${area}"
echo "fence: ${fence}"

echo "starting: ${fence}"
date
# Turn off the next line to just do sorting, like on a  blanket route
/usr/bin/docker run -t --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
# Now sort
echo "sorting: ${fence}"
date
/usr/bin/docker run -t --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
echo "done: ${area} / ${fence}"
date
