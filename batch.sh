#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

base_coords="/home/deve/pk/submodules/faster-routes/coords"
base_fr="/home/deve/pk/submodules/faster-routes"



### apex

# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-apex
echo "*****Starting ${fence}*****"
/usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
echo "*****${fence} Done*****"
#### Asheboro
#
## Specify sub directory
#area=z_utils
#
## Pick your fence.
#fence=sp-asheboro_expansion
#echo "*****Starting ${fence}*****"
#/usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
#/usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
#cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
#echo "*****${fence} Done*****"

### carrboro

# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-carrboro
echo "*****Starting ${fence}*****"
/usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json
echo "*****${fence} Done*****"

### Durham

# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-durham_cbd
echo "*****Starting ${fence}*****"
/usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
echo "*****${fence} Done*****"

### GSO

# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-gso
echo "*****Starting ${fence}*****"
/usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
echo "*****${fence} Done*****"

### CAM

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-cam
echo "*****Starting ${fence}*****"
/usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
echo "*****${fence} Done*****"