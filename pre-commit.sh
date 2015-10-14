#!/bin/bash
# copy common files to version directories
for VERSION in 0.9; do 
  rsync -a files/. $VERSION/files
  rsync -a hookit/. $VERSION/hookit
  git add $VERSION --all
done