#!/bin/bash

mkdir $2
cd $2
git clone git@$1:repo/neuroslink-artwork-usplash
git clone git@$1:repo/neuroslink-default-settings-open
git clone git@$1:repo/neuroslink-default-settings-ati
git clone git@$1:repo/neuroslink-default-settings-nvidia
git clone git@$1:repo/neuroslink-dev-scripts
git clone git@$1:repo/neuroslink-installcd
git clone git@$1:repo/neuroslink-meta
git clone git@$1:repo/neuroslink-restricted-extras
git clone git@$1:repo/neuroslink-system-tools
git clone git@$1:repo/neuroslink-dev-tools
git clone git@$1:repo/neuros-wallpapers
git clone git@$1:repo/mythtv-0.21.0+fixes18722
git clone git@$1:repo/mythtv-theme-neuroslink
git clone git@$1:repo/firefox-default-profile
