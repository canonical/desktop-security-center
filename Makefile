VM_NAME = aa-testing
SNAP_NAME = aa-prompting-test

.PHONY: snapd-prompting
snapd-prompting:
	lxc exec $(VM_NAME) -- snap refresh snapd --channel=latest/edge/prompting; \
	lxc exec $(VM_NAME) -- snap set system experimental.apparmor-prompting=true

.PHONY: snapd-stable
snapd-stable:
	lxc exec $(VM_NAME) -- snap refresh snapd --channel=latest/stable; \
	lxc exec $(VM_NAME) -- snap set system experimental.apparmor-prompting=false

# Sometimes we can get into a situation where snapd is stuck and stops sending notices
# for prompts. There is probably a lighter touch way of getting things working again
# but this does the trick.
.PHONY: bounce-snapd
bounce-snapd: snapd-stable snapd-prompting

.PHONY: create-vm
create-vm:
	if ! lxc info $(VM_NAME) 2>/dev/null ; then \
		lxc launch images:ubuntu/24.04/desktop $(VM_NAME) \
			--vm \
			-c limits.cpu=4 \
			-c limits.memory=4GiB; \
	elif ! lxc info $(VM_NAME) | grep "Status: RUNNING" ; then \
		lxc stop --force $(VM_NAME) 2>/dev/null; \
		lxc start $(VM_NAME); \
	fi
	while ! lxc exec $(VM_NAME) echo 2>/dev/null; do \
		echo "Waiting for $(VM_NAME) to be ready..."; \
		sleep 1; \
	done
	echo -e "\n:: Installing required packages..."
	lxc exec $(VM_NAME) -- apt install curl jq -y
	echo -e "\n:: Installing the latest/edge/prompting channel for snapd..."
	lxc exec $(VM_NAME) -- snap install snapd --channel=latest/edge/prompting
	echo -e "\n:: enabling prompting for snapd..."
	lxc exec $(VM_NAME) -- snap set system experimental.apparmor-prompting=true
	lxc file push prompt-loop.sh $(VM_NAME)/home/ubuntu/
	lxc exec $(VM_NAME) -- mkdir -p /home/ubuntu/test/nested

.PHONY: attach-vm
attach-vm:
	lxc console --type=vga $(VM_NAME)

.PHONY: attach-vm-bash
attach-vm-bash:
	lxc exec --cwd=/home/ubuntu $(VM_NAME) -- su ubuntu

.PHONY: update-test-snap
update-test-snap:
	snapcraft
	lxc file push $(SNAP_NAME)_0.1_amd64.snap $(VM_NAME)/home/ubuntu/
	lxc exec $(VM_NAME) -- snap install --dangerous /home/ubuntu/$(SNAP_NAME)_0.1_amd64.snap

.PHONY: update-client-in-vm
update-client-in-vm:
	cd aa-prompt-client && cargo build
	lxc file push aa-prompt-client/target/debug/aa-prompt-client $(VM_NAME)/home/ubuntu/

.PHONY: prepare-vm
prepare-vm: create-vm update-test-snap update-client-in-vm

.PHONY: run-prompt-client
run-prompt-client: prepare-vm
	lxc exec --user=1000 $(VM_NAME) -- /home/ubuntu/aa-prompt-client

.PHONY: integration-tests
integration-tests: prepare-vm
	cd aa-prompt-client && cargo test --no-run
	FNAME=$$(ls -ht aa-prompt-client/target/debug/deps/integration* | grep -Ev '\.d' | head -n1); \
	cp $$FNAME integration-tests; \
	lxc file push integration-tests $(VM_NAME)/home/ubuntu/; \
	rm integration-tests; \
	lxc exec $(VM_NAME) -- rm -rf /home/ubuntu/test; \
	lxc exec --user=1000 --env HOME=/home/ubuntu $(VM_NAME) /home/ubuntu/integration-tests;

.PHONY: clean
clean:
	lxc stop --force $(VM_NAME) 2>/dev/null || true
	lxc delete $(VM_NAME) 2>/dev/null || true
