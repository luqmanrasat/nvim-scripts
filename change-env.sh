#!/bin/bash

# Set defaults
ENV_LIST=("lazyvim" "road_to_pde") # add available env to this list
DEFAULT_ENV=0                      # set default env position

# Prompt select environment
selectedOption=${ENV_LIST[${DEFAULT_ENV}]}
echo "Enter environment number to use (default is ${DEFAULT_ENV}):
$(for i in "${!ENV_LIST[@]}"; do
	echo "$i: ${ENV_LIST[i]}"
done)"
read -rp "> " selectedIndex

if [ ! "${ENV_LIST[$selectedIndex]}" ]; then
	echo "Invalid selection!"
	exit
fi

if [ "$selectedIndex" != ${DEFAULT_ENV} ]; then
	selectedOption="${ENV_LIST[$selectedIndex]}"
fi

# Delete existing symlinks & create new symlinks
rm -f ~/.config/nvim ~/.cache/nvim ~/.local/share/nvim ~/.local/state/nvim
ln -s ~/.config/nvim-"$selectedOption" ~/.config/nvim
ln -s ~/.cache/nvim-"$selectedOption" ~/.cache/nvim
ln -s ~/.local/share/nvim-"$selectedOption" ~/.local/share/nvim
ln -s ~/.local/state/nvim-"$selectedOption" ~/.local/state/nvim

# Print current env name
echo "Current environment: ${selectedOption}"
