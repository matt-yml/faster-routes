#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built



#nohup ./ash.sh &> nohup-ash.txt &
#sleep 1
nohup ./ral.sh &> nohup-ral.txt &
sleep 1
#nohup ./gso.sh &> nohup-gso.txt &
sleep 1
nohup ./cab.sh &> nohup-cab.txt &
sleep 1
#nohup ./cha.sh &> nohup-cha.txt &
sleep 1
nohup ./cam.sh &> nohup-cam.txt &
sleep 1
#nohup ./durham.sh &> nohup-durham.txt &
