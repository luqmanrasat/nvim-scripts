#!/bin/bash

# Set defaults
DEFAULT_ENV=0 # set default env position

# Add available env to list
envList=($(ls ~/.config | grep nvim- | sed s/nvim-//g))

# Prompt select environment
selectedOption=${envList[${DEFAULT_ENV}]}
echo "Enter environment number to use (default is ${DEFAULT_ENV}):
$(for i in "${!envList[@]}"; do
	echo "$i: ${envList[i]}"
done)"
read -rp "> " selectedIndex

if [ ! "${envList[$selectedIndex]}" ]; then
	echo "Invalid selection!"
	exit
fi

if [ "$selectedIndex" != ${DEFAULT_ENV} ]; then
	selectedOption="${envList[$selectedIndex]}"
fi

# Delete existing symlinks & create new symlinks
rm -f ~/.config/nvim ~/.cache/nvim ~/.local/share/nvim ~/.local/state/nvim
ln -s ~/.config/nvim-"$selectedOption" ~/.config/nvim
ln -s ~/.cache/nvim-"$selectedOption" ~/.cache/nvim
ln -s ~/.local/share/nvim-"$selectedOption" ~/.local/share/nvim
ln -s ~/.local/state/nvim-"$selectedOption" ~/.local/state/nvim

# Print current env name
echo "Current environment: ${selectedOption}"
