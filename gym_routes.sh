#!/bin/bash
# Automate the routing process. Pass straight to sort
# NOTE: Docker container that actually runs the scripts must already be built

/home/deve/coords/ash_gym.sh
echo "sleeping 5s"
sleep 5

/home/deve/coords/cab_gym.sh
echo "sleeping 5s"
sleep 5

/home/deve/coords/clt_gym.sh
echo "sleeping 5s"
sleep 5


/home/deve/coords/gso_gym.sh
echo "sleeping 5s"
sleep 5

/home/deve/coords/p10_gym.sh
echo "sleeping 5s"
sleep 5

/home/deve/coords/rdu_gym.sh
