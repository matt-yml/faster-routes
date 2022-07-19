#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

## Copy the unknown spawn point config in
#cp /home/deve/pk/submodules/faster-routes/config_sp_ukn.json /home/deve/pk/submodules/faster-routes/config.json
#
#/usr/bin/docker run -it --rm -v /home/deve/pk/submodules/faster-routes:/usr/src/app -v /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-westcamparks.fence:/usr/src/app/fence.txt faster-routes
#/usr/bin/docker run -it --rm -v /home/deve/pk/submodules/faster-routes/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
#cp route.txt /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-westcamparks.route
#

base_coords="/home/deve/pk/submodules/faster-routes/coords"
base_fr="/home/deve/pk/submodules/faster-routes"

# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-cam

# Turn off the next line to just do sorting, like on a  blanket route
/usr/bin/docker run -t --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes

# Now sort
/usr/bin/docker run -t --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
