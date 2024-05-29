# Apparmor prompting local testing


## Getting set up
```bash
$ sudo apt install virt-viewer
$ sudo snap install lxd
$ sudo snap install snapcraft --classic
```

## Spinning up a VM via lxd

```bash
$ lxc launch images:ubuntu/24.04/desktop aa-testing \
  --vm \
  -c limits.cpu=4 \
  -c limits.memory=4GiB \
  --console=vga

# Later to restart
$ lxc start aa-testing --console=vga
```
