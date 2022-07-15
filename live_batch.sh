#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

base_coords="/home/deve/pk/submodules/faster-routes/coords"
base_fr="/home/deve/pk/submodules/faster-routes"

echo "set config to known points only"
cp ${base_fr}/config_sp_kn.json ${base_fr}/config.json

#area="cam"
# Apex
#fences=("apex_compark" "apex_dt" "danvers")
# Cary
#fences=("parkwaypnt" "ritterpark" "bond" "cary_cbd" "northwoods" "waverly")
# CAM
#fences=("apex_compark" "apex_dt" "danvers" "parkwaypnt" "ritterpark" "bond" "cary_cbd" "northwoods" "waverly")
# Raleigh CBD
#area="raleigh"
#fences=("ral_CBD")
# Raleigh NW
#area="raleigh_NW"
#fences=("6forks" "crabtree" "glenwood" "neuse" "northhills" "statefair" "trinity")
# GSO
#area="gso"
#fences=("arbor" "downtown" "friendly" "uncg")
# Cabarrus
#area="cabarrus"
#fences=("concord_cbd" "kannapolis_cbd" "liskepark")
# Asheboro
area="asheboro"
fences=("cbd" "walmart")

i=0
  for fence in ${!fences[@]}
    do
    echo "routing ${area}/${fences[$fence]}"
    /usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${base_coords}/${area}/${fences[$fence]}.fence:/usr/src/app/fence.txt faster-routes
    /usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
    # Save individual route
    cp ${base_fr}/route.txt ${base_coords}/${area}/${city}/${fences[$fence]}.route
    
    if [ "$i" -eq "0" ];
    then
      # First one only - overwrite the existing route
      #echo "backup the existing master route to: ${base_coords}/${area}/${area}_M.route_bak"
      #cp ${base_coords}/${area}/${area}_M.route ${base_coords}/${area}/${area}_M.route_bak
      echo "creating ${area}_M.route"
      cat ${base_fr}/route.txt > ${base_coords}/${area}/${area}_M.route
    else
      echo "adding ${fences[$fence]} to ${area}_M.route"
      cat ${base_fr}/route.txt >> ${base_coords}/${area}/${area}_M.route
    fi
    let "i++"
  done

echo "\n\n"
echo "Sort the final master route"
/usr/bin/docker run -it --rm -v ${base_coords}/${area}/${area}_M.route:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt

