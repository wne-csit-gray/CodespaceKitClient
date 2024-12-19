#!/bin/bash

# If the folder that was opened is a kit (.kit exists)
# install the kit features.
if [ -d .kit ]; then
  echo "Its a kit!"
  #.kit/install-features-into-client/run.sh
else
  echo "Its not a kit!"
fi