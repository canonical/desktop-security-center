#!/usr/bin/env bash

echo -e "\n:: Installing required packages..."
apt install make curl jq -y
snap install snapd

echo -e "\n:: Moving over to the edge/latest/prompting channel for snapd..."
make snapd-prompting

echo -e "\n:: Installing the testing snap..."
snap install ./aa-prompting-test_0.1_amd64.snap --dangerous

echo -e "\n:: Done"
