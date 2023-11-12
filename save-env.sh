!#/bin/bash

# Prompt environment name
echo "Enter env name:"
read -pf envName

# Rename existing config folders
mv ~/.config/nvim ~/.config/nvim-"${envName}"
mv ~/.cache/nvim ~/.cache/nvim-"${envName}"
mv ~/.local/share/nvim ~/.local/share/nvim-"${envName}"
mv ~/.local/share/nvim ~/.local/share/nvim-"${envName}"

# Delete existing symlinks & create new symlinks
rm -f ~/.config/nvim ~/.cache/nvim ~/.local/share/nvim ~/.local/state/nvim
ln -s ~/.config/nvim-"$envName" ~/.config/nvim
ln -s ~/.cache/nvim-"$envName" ~/.cache/nvim
ln -s ~/.local/share/nvim-"$envName" ~/.local/share/nvim
ln -s ~/.local/state/nvim-"$envName" ~/.local/state/nvim

# Print current env name
echo "Current environment: ${envName}"
