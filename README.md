# Apparmor prompting client

> See [SD121][0] and [UD062][1] for specs covering the snapd and client
> implementations respectively.

![screenshot](./screenshot.png)


## Providing feedback

The current primary use case of this repository is to gather feedback on what
using apparmor prompting looks like with "real" desktop workloads.

Please provide feedback of any issues or otherwise "interesting" behaviour
observed from snaps when running under apparmor prompting
[here](https://docs.google.com/document/d/104pOAS-vZB48zq2ZpJbBLI23WlfHrYJd_UrgCZwwBpY/edit).


## Getting set up

### Running in a lxd VM (Recommended)

So long as you have `lxd` installed you will be able to quickly spin up and
bootstrap a VM for local testing against the `latest/edge` channel
of snapd.

> If you have your own preferred workflow for local development and testing
> this is not a requirement, but it does help standardise how we test changes
> on both the client and snapd sides ;)

The first time you are setting up your test VM, running the following from
your host should be sufficient to get you a local testing environment.
```bash
$ sudo make install-local-tooling
$ make prepare-vm
```

This will install the required local tooling for provisioning the VM and
building both the prompting client snap and a simple test snap which is used as
part of the integration test suite (see below). If you did not already have
`lxd` installed, you will need to log out and back in for your user to be added
to be able to interact with lxd. Alternatively you can run `newgrp lxd` as
described in [the lxd installation docs][2].

Once the VM is up and running you then need to run `make attach-vm` to open a
VGA console and close gnome-initial-setup. Once that is done you need to run
`make bounce-snapd` from your host and then you should be able to run the client
in a terminal in the VM to start listening for prompts:
```bash
$ prompting-client -vv flutter
```

### Running locally

If you are already inside of an Ubuntu VM or want to try running apparmor
prompting on your host, you can use the `local-*` Makefile targets to build and
install the client locally and move over to the prompting branch of `snapd`.

> **WARNING**: When testing things out inside of a VM we have seen that it is
> entirely possible to get your system into a bad state if prompts aren't
> handled correctly. If you are planning on running this on your host then
> please be aware that you may end up with unexpected behaviour and snaps
> hanging on syscalls if there are any issues with the current state of the
> prompting client.

```bash
$ make local-snapd-prompting
$ make local-install-client
$ make local-bounce-snapd

# To move back to the stable channel of snapd
$ make local-snapd-stable
```

Running the client is then the same as when inside of a VM:
```bash
$ prompting-client -vv flutter
```

Note that any prompts generated between enabling prompting and starting the
client will be unactioned and may result in unexpected behaviour from installed
snaps.

## Running the integration tests

If you have a local Rust toolchain installed you will be able to build and run
the integration test suite like so (To get set up with Rust locally on Ubuntu,
see the Bootstrapping a new Rust installation section of [this blog post][3]):
```bash
$ make integration-tests
```
> **Note**: this shares the same `aa-testing` VM as the other `make` directives.

This test suite is not intended for full coverage of the API interactions
between the client and snapd, but it should be sufficient to check and validate
the behaviour of the client against the most recent `latest/edge`
channel of snapd.


## Running the prompting client

Once you have a working VM setup you should be able to open a VGA console by
running `make attach-vm` on your host. From there, the client can be started in
a terminal:
```bash
$ prompting-client flutter # optionally 'prompting-client -vv flutter' for verbose logging
```

With the client running you should then be able to interact with snaps and
generate prompts.

> **Note**: Running `prompting-client` will show the other commands available
> from the client.


## Resetting snapd

Occasionally you will find that snaps hang or that a previous reply to a prompt
you have made has caused things to error or become unresponsive. If that happens
you can run `make bounce-snapd` from your host to attempt to clean up your
local state in the VM. This will:
  - remove the current `/var/lib/snapd/request-rules.json` file if it exists
  - move snapd back to the stable channel and disable the `apparmor-prompting` feature
  - move snapd to the prompting channel and enable the `apparmor-prompting` feature


  [0]: https://docs.google.com/document/d/1tBnefdukP69EUJOlH8bgD2hrvZCYoE8-1ZlqRRYlOqc/edit
  [1]: https://docs.google.com/document/d/1zJVbo3rRc0yfNMTloE2vJGVldHLC0-PmxAyJoFn7mwE/edit
  [2]: https://documentation.ubuntu.com/lxd/en/latest/installing/
  [3]: https://ubuntu.com/blog/why-and-how-to-use-rust-on-ubuntu
