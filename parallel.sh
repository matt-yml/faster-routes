#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

nohup ./cab.sh &> nohup-cab.txt &
nohup ./cam.sh &> nohup-cam.txt &
nohup ./cha.sh &> nohup-cha.txt &
#nohup ./durham.sh &> nohup-durham.txt &
nohup ./gso.sh &> nohup-gso.txt &
#nohup ./ral.sh &> nohup-ral.txt &