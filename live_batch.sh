#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

## Sanity
#i=0
#j=0
#if [ "$i" -eq "0" ];
#then
#  echo "i is 0"
#  echo "j is $j"
#else
#  let "j++"
#  echo "i is $i"
#  echo "j is $j"
#fi

base_coords="/home/deve/pk/submodules/faster-routes/coords"
base_fr="/home/deve/pk/submodules/faster-routes"

echo "set config to known points only"
cp ${base_fr}/config_sp_kn.json ${base_fr}/config.json

area="cam"
#fences=("bond" "cary_cbd" "northwoods" "parkwaypnt" "ritterpark" "silvercreek" "waverly")

# Apex
#fences=("apex_compark" "apex_dt" "danvers")
# Cary
#fences=("parkwaypnt" "ritterpark" "bond" "cary_cbd" "northwoods" "waverly")
# CAM
fences=("apex_compark" "apex_dt" "danvers" "parkwaypnt" "ritterpark" "bond" "cary_cbd" "northwoods" "waverly")

i=0
  for fence in ${!fences[@]}
    do
    echo "routing ${area}/${cities[$city]}/${fences[$fence]}"
    /usr/bin/docker run -it --rm -v ${base_fr}:/usr/src/app -v ${base_coords}/${area}/${city}/${fences[$fence]}.fence:/usr/src/app/fence.txt faster-routes
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

