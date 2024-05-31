.PHONY: snapd-prompting
snapd-prompting:
	snap refresh snapd --channel=latest/edge/prompting
	snap set system experimental.apparmor-prompting=true

.PHONY: snapd-stable
snapd-stable:
	snap refresh snapd --channel=latest/stable
	snap set system experimental.apparmor-prompting=false

# Sometimes we can get into a situation where snapd is stuck and stops sending notices
# for prompts. There is probably a lighter touch way of getting things working again
# but this does the trick.
.PHONY: bounce-snapd
bounce-snapd:
	snap refresh snapd --channel=latest/stable
	snap refresh snapd --channel=latest/edge/prompting
	snap set system experimental.apparmor-prompting=false
	snap set system experimental.apparmor-prompting=true

.PHONY: create-vm
create-vm:
	lxc launch images:ubuntu/24.04/desktop aa-testing \
	  --vm \
	  -c limits.cpu=4 \
	  -c limits.memory=4GiB \
	  --console=vga

.PHONY: attach-vm
attach-vm:
	lxc console --type=vga aa-testing

.PHONY: update-test-snap
update-test-snap:
	snapcraft
	lxc file push aa-prompting-test_0.1_amd64.snap aa-testing/home/ubuntu/

.PHONY: copy-vm-bootstrap
copy-vm-bootstrap: update-test-snap
	lxc file push Makefile aa-testing/home/ubuntu/
	lxc file push bootstrap-vm.sh aa-testing/home/ubuntu/
	lxc file push prompt-loop.sh aa-testing/home/ubuntu/

.PHONY: update-client-in-vm
update-client-in-vm:
	cd aa-prompt-client && cargo build
	lxc file push aa-prompt-client/target/debug/aa-prompt-client aa-testing/home/ubuntu/
