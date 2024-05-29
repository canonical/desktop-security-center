# Apparmor prompting local testing

![screenshot](./screenshot.png)

## Getting set up
```bash
$ sudo apt install virt-viewer
$ sudo snap install lxd
$ sudo snap install snapcraft --classic
```

## Spinning up a VM via lxd

```bash
$ make create-vm

# In a second terminal
$ make copy-vm-bootstrap
$ make update-client-in-vm

# In a terminal in the vm
$ sudo ./bootstrap-vm.sh
```


## Running the example CLI client
```bash
$ ./aa-prompt-client

# In another terminal
$ aa-prompting-test.read
```


## TODO
- [ ] Automated integration test suite
