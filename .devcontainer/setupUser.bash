#!/bin/bash

# This script runs everytime a folder is opened.  
# So, only do the setup if the kit has not already been setup.
#   Note: the .kitIsSetup file is created by the emptyWorkspace.bash script
#         which is run by a task on folderOpen in the .devcontainer.json file.
if [ ! -f /home/$USER/.kitIsSetup ]; then

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
fi


