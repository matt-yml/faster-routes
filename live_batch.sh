#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

base_coords="/home/deve/coords/coords"
base_fr="/home/deve/coords"

# Map desired config into container
cfg=${base_fr}/config_sp_kn.json
echo "Using configuration:"
cat ${cfg}

#area="cam"
# Apex
#fences=("apex_compark" "apex_dt" "danvers")
# Cary
#area="cary"
#fences=("parkwaypnt" "ritterpark" "bond" "cary_cbd" "northwoods" "waverly" "caryglenn" "tbrooks")
# CAM
#area="cam"
#fences=("apex_compark" "apex_dt" "danvers" "parkwaypnt" "ritterpark" "bond" "cary_cbd" "northwoods" "waverly" "caryglenn" "tbrooks")
# Raleigh CBD
#area="raleigh"
#fences=("ral_CBD" "statefair" "trinity" "tryonwheeler")
# Raleigh NW
#area="raleigh_NW"
#fences=("dtwf" "6forks" "crabtree" "glenwood" "neuse" "northhills")
# GSO
#area="gso"
#fences=("arbor" "downtown" "friendly" "uncg") # "cust_mbob_hood0" "cust_mbob_hood1" "cust_mbob_ghillcem" 
# Cabarrus
#area="cabarrus"
#fences=("cmills" "concord_cbd" "kannapolis_cbd" "liskepark")
# Asheboro
area="asheboro"
fences=("cbd" "walmart" "zoo-in" "zoo-ext")
# Chapel Hill
#area="chapelhill"
#fences=("cbd" "umall" "svillage")
# Durham
#area="durham"
#fences=("southpoint" "briercreek" "dtdur" "dukegardens" "maplewood" "atc")
# chatham co
#area="chatham"
#fences=("dtpitts" "powell" "chathampk" "briarchapel" "fearrington" "bynum")
# alamance
#area="alamance"
#fences="elon"
# fuquay-varina
#area="fv"
#fences=("fvcore")
#harnett co
#area="harnett"
#fences=("angier" "campbell")
#holly springs
#area=hollysprings
#fences=("stinson" "arborcreek" "braxtonvillage" "southpark" "12oaks")
# winston salem
#area="wsm"
#fences=("dtlews" "dtclem")

i=0
  for fence in ${!fences[@]}
    do
    echo "routing ${area}/${fences[$fence]}"
    /usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/route.txt -v ${cfg}:/usr/src/app/config.json -v ${base_coords}/${area}/${fences[$fence]}.fence:/usr/src/app/fence.txt faster-routes
    /usr/bin/docker run -it --rm -v ${base_fr}/route.txt:/usr/src/app/infile.txt sct python cluster.py -jsf infile.txt
    cp ${base_fr}/route.txt ${base_fr}/coords/${area}/${fence}.route
    
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

