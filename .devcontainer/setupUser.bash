#!/bin/bash

# Setup the user if it has not been setup already.
if [ ! -d /workspaces/$USER ]; then

  echo "Setting up the user."

  # Link the users home directory into a subdirectory of workspace.
  # This will allow dirs in the home directory to bind mount into docker containers.
  ln -s /home/$USER /workspaces/$USER

  # Do some basic git configuration
  git config --global merge.conflictstyle diff3 \
   && git config --global mergetool.vscode.cmd 'code --wait $MERGED' \
   && git config --global merge.tool vscode \
   && git config --global mergetool.keepBackup false \
   && git config --global core.editor "nano" \
   && git config --global pull.ff only \
   && git config --global init.defaultBranch main \
   && git config --global safe.directory '*' \
   && echo "" >> "/home/$USER/.bashrc" \
   && echo "source /usr/share/bash-completion/completions/git" >> "/home/$USER/.bashrc" 

  # Install a global git hook that will install the kit features after it is cloned.
  sudo cp /workspaces/$RepositoryName/.devcontainer/install-kit-features-into-client.sh /usr/share/git-core/templates/hooks/post-checkout
  sudo chmod +x /usr/share/git-core/templates/hooks/post-checkout

  # Reopen VSCode without any folders open.
  #code -r
else 
  echo "User is already setup."
fi