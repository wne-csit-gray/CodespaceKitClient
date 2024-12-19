#!/bin/bash

# This script runs everytime a folder is opened.  
# So, only do the setup if the kit has not already been setup 
if [ ! -f /home/$USER/.kitIsSetup ]; then

  # Link the users home directory into a subdirectory of workspace.
  # This will allow dirs in the home directory to bind mount into docker containers.
  ln -s /home/$USER /workspaces/$USER

  # Do some basic git configuration
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

  # Copy the kitty hook into the workspace.
  sudo cp "/workspaces/$RepositoryName/.devcontainer/install-kit-features-into-client.sh" \
          "/usr/share/git-core/templates/hooks/post-checkout"

  # Reopen VSCode without any folders open.
  code -r

  # Create a flag file so we only do the setup once.
  touch "/home/$USER/.kitIsSetup"
fi


