#!/usr/bin/env bash

passwd
apt install make curl jq -y
snap install snapd
make snapd-prompting
snap install ./aa-prompting-test_0.1_amd64.snap --dangerous
echo "testing testing 1 2 3" > readme.txt
