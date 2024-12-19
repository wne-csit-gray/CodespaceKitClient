#!/bin/bash

# Setup the user if it has not been setup already.
if [ ! -d /workspaces/$USER ]; then

  # Link the users home directory into a subdirectory of workspace.
  # This will allow dirs in the home directory to bind mount into docker containers.
  rm /workspaces/$USER
  ln -s /home/$USER /workspaces/$USER

  # Do some basic git configuration
  git git config --global merge.conflictstyle diff3 \
   && git config --global mergetool.vscode.cmd 'code --wait $MERGED' \
   && git config --global merge.tool vscode \
   && git config --global mergetool.keepBackup false \
   && git config --global core.editor "nano" \
   && git config --global pull.ff only \
   && git config --global init.defaultBranch main \
   && git config --global safe.directory '*' \
   && echo "" >> .bashrc \
   && echo "source /usr/share/bash-completion/completions/git" >> .bashrc 

  # Reopen VSCode without any folders open.
  #code -r
fi

# If the folder that was opened is a kit (.kit exists)
# install the kit features.
if [ -d .kit ]; then
  echo "Its a kit!"
  #.kit/install-features-into-client/run.sh
else
  echo "Its not a kit!"
fi