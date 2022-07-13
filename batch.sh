#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

# Copy the unknown spawn point config in
cp /home/deve/pk/submodules/faster-routes/config_sp_ukn.json /home/deve/pk/submodules/faster-routes/config.json

/usr/bin/docker run -it --rm -v /home/deve/pk/submodules/faster-routes:/usr/src/app -v /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-westcamparks.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v /home/deve/pk/submodules/faster-routes/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp route.txt /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-westcamparks.route

/usr/bin/docker run -it --rm -v /home/deve/pk/submodules/faster-routes:/usr/src/app -v /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-craleigh.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v /home/deve/pk/submodules/faster-routes/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp /home/deve/pk/submodules/faster-routes/route.txt /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-craleigh.route