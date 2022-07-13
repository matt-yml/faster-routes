#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

# Clean out raid channels
#/usr/bin/docker run  -t --rm  purge -a raids.ini
#docker run -it --rm -v /home/deve/pk/submodules/faster-routes:/usr/src/app -v /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-craleigh.fence:/usr/src/app/fence.txt faster-routes
#docker run -it --rm -v /home/deve/pk/submodules/faster-routes/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
#cp route.txt /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-craleigh.route

/usr/bin/docker run -it --rm -v /home/deve/pk/submodules/faster-routes:/usr/src/app -v /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-westcamparks.fence:/usr/src/app/fence.txt faster-routes
/usr/bin/docker run -it --rm -v /home/deve/pk/submodules/faster-routes/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
cp route.txt /home/deve/pk/submodules/faster-routes/coords/z_utils/sp-westcamparks.route