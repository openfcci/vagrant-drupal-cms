## Install ##

1. Install [vagrant][1] and [virtualbox][2]. If you're on mavericks it will complain about unsigned kexts when you install virtualbox. It appears to work anyways.
2. You'll need to clone this into the same directory as fcc-drupal-cms. This expects fcc-drupal-cms to be in a directory named fcc-drupal-cms.
3. cd into the directory
4. run `sudo gem install bundler`
5. run `bundle install`

You'll have to manually add the sites to `/etc/hosts` file, the default prefix is `dev` and the ip is `172.16.0.10`.

## Usage ##

1. Go to the directory where you cloned the repo (~/src if you used boxen)
2. set up your prefix in the Vagrantfile by changing the value of the `prefix` variable near the top.
3. run `./dev up` to start up

Once that completes, you'll have a virtual server for the drupal cms running on `172.16.0.10`.

### Live data ###

1. Go to the directory where you cloned the repo
2. run `./dev build --live`
    - You will need to be connected to the forum's network to do this as it either has to download a database dump or the built container
    - This will take a long time

When that completes, you will have a working dev box with the live data. To do an upgrade routine run `./dev upgrade` that will drop the current state and use the database restore from the last time that you ran it. It takes about 15 minutes to run the upgrade routine.

### Other functions ###

- To shut down the dev environment run `vagrant halt`
- To start up the dev environment run `./dev up`. You can add `--live` to use the live database
- To do a default build you can run `./dev build`
- If you wish to reset the database to the last build you can run `./dev reset`
- To clear the caches run `./dev cc`

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

[1]:http://www.vagrantup.com/downloads.html
[2]:https://www.virtualbox.org/wiki/Downloads
[3]:http://packer.io
[4]:https://github.com/openfcci/our-boxen
