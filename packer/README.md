# Packer Template for Docker Images

This repository contains a [Packer][1] template for building machine images for use
with our vagrant.

## Usage

First, [install Packer](http://www.packer.io/intro/getting-started/setup.html),
I would recommend installing it using brew:

    brew tap homebrew/binary
    brew install packer

Then simply run `packer build fcc-vagrant.json` and it will build a new vagrant box
for you. Once it is complete, you can import it directly into vagrant using
`vagrant box add <name> fcc-vagrant.box`. Be sure to check the Vagrantfile to
determine what the name should be.

## Releasing

If you simply remade it for adding the updates in by default, all you need to do is
upload it to dbdumps.fccinteractive.comr, replacing the current one. However, if
you added things to it, you will also need to change the name of the box in the
Vagrantfile so that everyone will download the updated version. I would suggest
changing the name to something like `fcc-vagrant-<todays date>`.

[1]:http://packer.io
