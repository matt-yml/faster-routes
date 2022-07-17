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

/usr/bin/docker run --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route

### Asheboro

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-asheboro_expansion

/usr/bin/docker run --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route


### carrboro

# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-carrboro

/usr/bin/docker run --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json

### Durham

# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-durham_cbd

/usr/bin/docker run --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route

### GSO

# Map desired config into container
cfg=${base_fr}/config_sp_ukn.json

# Specify sub directory
area=z_utils

# Pick your fence.
fence=sp-gso

/usr/bin/docker run --rm -v ${base_fr}:/usr/src/app -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fence}.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route

