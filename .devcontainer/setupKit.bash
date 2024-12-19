#!/bin/bash

# If the folder that was opened is a kit (.kit exists)
# install the kit features.
if [ -d .kit ]; then
    .kit/install-features-into-client/run.sh
fi

# Mark the kit as setup and and restart VSCode without
# a directory open.
if [ ! -f /home/$USER/.kitIsSetup ]; then
    touch /home/$USER/.kitIsSetup
    code -r
fi