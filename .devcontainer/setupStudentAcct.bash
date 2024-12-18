#!/bin/bash

# Link the users home directory into a subdirectory of workspace.
# This will allow dirs in the home directory to bind mount into docker containers.
if [ ! -d /workspaces/$USER ]; then
    ln -s /home/$USER /workspaces/$USER
fi

# Do some basic git configuration.
if [ -z "$(git config --global core.editor)" ]; then
  git config --global credential.helper store \
   && git config --global merge.conflictstyle diff3 \
   && git config --global merge.tool vscode \
   && git config --global mergetool.keepBackup false \
   && git config --global core.editor "nano" \
   && git config --global pull.ff only \
   && git config --global init.defaultBranch main \
   && git config --global safe.directory '*' \
   && echo "" >> .bashrc \
   && echo "source /usr/share/bash-completion/completions/git" >> .bashrc 
fi

 


