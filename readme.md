## Usage ##

1. Install [vagrant][1] and [virtualbox][2], any version prior to 4.3 (vagrant currently doesn't work with 4.3).
2. Install the plugin vagrant-mountcommand `vagrant plugin install vagrant-mountcommand`
3. You'll need to clone this into the same directory as fcc-drupal-cms. This expects fcc-drupal-cms to be in a directory named fcc-drupal-cms.
4. cd into this directory
5. set up your prefix in the Vagrantfile by changing the value of the `prefix` variable near the top.
6. run `vagrant up`

Once that completes, you'll have a virtual server for the drupal cms running on `172.16.0.10`. If you want to run multiple boxes at once, all you need to do is change the `ip` and `prefix` variables. If you want to connect to the vm use `vagrant ssh` and that will log you in with the vagrant user which has password-less sudo access. You can shut down the vm with `vagrant halt` and delete it with `vagrant delete`. If you want to start the vm after shutting it down just run `vagrant up`, it won't reprovision it. If you want a clean box run `vagrant reload --provision` if your box is currently running. If it isn't running, run `vagrant up --provision` for a clean box.

If you need the live database, move the database dump into the database directroy. then the database dump will be available on the box at `/exports`

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
