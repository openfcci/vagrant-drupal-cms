#!/bin/bash

sudo aptitude install -y puppet

sudo usermod -a -G puppet vagrant
sudo usermod -a -G puppet root
