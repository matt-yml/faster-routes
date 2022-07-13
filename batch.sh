#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

# Clean out raid channels

docker run -it --rm -v "$(pwd)":/usr/src/app -v "$(pwd)"/coords/z_utils/sp-westcamparks.fence:/usr/src/app/fence.txt faster-routes
docker run -it --rm -v "$(pwd)"/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp route.txt ./coords/z_utils/sp-westcamparks.route

docker run -it --rm -v "$(pwd)":/usr/src/app -v "$(pwd)"/coords/z_utils/sp-craleigh.fence:/usr/src/app/fence.txt faster-routes
docker run -it --rm -v "$(pwd)"/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp route.txt ./coords/z_utils/sp-craleigh.route
