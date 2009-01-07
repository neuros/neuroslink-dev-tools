#!/bin/bash

mkdir $2.git
cd $2.git
git init
touch README
git add README
git commit -m 'Initial Commit'
git remote add origin git@$1:repo/$2.git
git push origin master
