#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

base_coords="/home/deve/devrepo/coords/maps/pk/volumes/rdm/coords"
base_fr="/home/deve/devrepo/coords/submodules/faster-routes"

# Map desired config into container
cfg=${base_fr}/config_gym.json

# Specify sub directory
area=asheboro

# Pick your fence.
fence=ash_rmn

echo "*****Starting ${fence}*****"
date
# Turn off the next line to just do sorting, like on a  blanket route
/usr/bin/docker run -t --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
date
# Now sort
/usr/bin/docker run -t --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
echo "*****Done with: ${fence}*****"
date
