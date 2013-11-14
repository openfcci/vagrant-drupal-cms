## Install ##

1. Install [vagrant][1] and [virtualbox][2]. If you're on mavericks it will complain about unsigned kexts when you install virtualbox. It appears to work anyways.
2. Install the plugin vagrant-mountcommand `vagrant plugin install vagrant-mountcommand`
3. Install the plugin vagrant-cachier `vagrant plugin install vagrant-cachier`
4. You'll need to clone this into the same directory as fcc-drupal-cms. This expects fcc-drupal-cms to be in a directory named fcc-drupal-cms.

Or setup boxen from [https://github.com/openfcci/our-boxen][4]

## Usage ##

1. Go to the directory where you cloned the repo (~/src if you used boxen)
2. set up your prefix in the Vagrantfile by changing the value of the `prefix` variable near the top.
3. run `vagrant up`

Once that completes, you'll have a virtual server for the drupal cms running on `172.16.0.10`. If you want to run multiple boxes at once, all you need to do is change the `ip` and `prefix` variables. If you want to connect to the vm use `vagrant ssh` and that will log you in with the vagrant user which has password-less sudo access. You can shut down the vm with `vagrant halt` and delete it with `vagrant delete`. If you want to start the vm after shutting it down just run `vagrant up`, it won't reprovision it. If you want a clean box run `vagrant reload --provision` if your box is currently running. If it isn't running, run `vagrant up --provision` for a clean box.

If you need the live database, move the database dump into the database directroy. then the database dump will be available on the box at `/exports`

## Xdebug ##

If you want/need to use xdebug, it will require some setup. You'll need to configure your ide to listen on external interfaces. You'll also need to set the `xdebug` variable to `On`. Then setup the variables in the "xdebug" section of the Vagrantfile to be whatever you need for your ide to connect. Finally, you'll need to reprovision your vm, `vagrant provision --provision-with chef_solo` so that it wont run a default build.

## Base Box ##

The basebox is custom generated using [packer][3]. The template for packer lives in `packer`, if you care to take a look.

## Cleanup ##

The basebox gets updated periodically and we've choosen to add the new one under a
new name instead of requiring you to remove the old one to download the new one.
This means that vagrant will still have old baseboxes on your system. To clean these up:

1. run `vagrant box list`
2. You can remove all but the most recent one, run `vagrant box delete <basebox> virtualbox`

[1]:http://downloads.vagrantup.com
[2]:https://www.virtualbox.org/wiki/Downloads
[3]:http://packer.io
[4]:https://github.com/openfcci/our-boxen
