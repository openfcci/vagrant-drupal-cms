## Usage ##

1. Install [vagrant][1] and [virtualbox][2]
2. You'll need to clone this into the same directory as fcc-drupal-cms. This expects fcc-drupal-cms to be in a directory named fcc-drupal-cms.
3. cd into this directory
4. set up your prefix in the Vagrantfile by changing the value of the `prefix` variable near the top.
5. run `vagrant up`

Once that completes, you'll have a virtual server for the drupal cms running on `172.16.0.10`. If you want to run multiple boxes at once, all you need to do is change the `ip` and `prefix` variables. If you want to connect to the vm use `vagrant ssh` and that will log you in with the vagrant user which has password-less sudo access. You can shut down the vm with `vagrant halt` and delete it with `vagrant delete`. If you want to start the vm after shutting it down just run `vagrant up`, it won't reprovision it. If you want a clean box run `vagrant reload --provision` if your box is currently running. If it isn't running, run `vagrant up --provision` for a clean box.

If you need the live database, move the database dump into the database directroy. then the database dump will be available on the box at `/exports`

[1]:http://downloads.vagrantup.com
[2]:https://www.virtualbox.org/wiki/Downloads
