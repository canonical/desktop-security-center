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
