

#!/bin/bash

# Define the command to be replaced
command_name="python3"

# Ask the user which alias they want to use
read -p "Do you want to use 'p' or 'py' as the alias? Enter 'p' or 'py': " alias_choice

# Set the alias name based on the user's choice
if [[ "$alias_choice" == "p" ]]; then
    alias_name="p"
elif [[ "$alias_choice" == "py" ]]; then
    alias_name="py"
else
    echo "Invalid option. Alias not set."
    exit 1
fi

# Check if the profile file exists
if [[ -f ~/.bashrc ]]; then
    profile_file=~/.bashrc
elif [[ -f ~/.zshrc ]]; then
    profile_file=~/.zshrc
else
    echo "Profile file not found!"
    exit 1
fi

# Check if the alias already exists in the profile file
if grep -Fxq "alias $alias_name='$command_name'" $profile_file; then
    echo "The alias '$alias_name' is already defined in the $profile_file file."
else
    # Add the alias to the profile file
    echo "alias $alias_name='$command_name'" >> $profile_file
    echo "Alias '$alias_name' added to the $profile_file file."
    echo "Run 'source $profile_file' to apply the changes to the current environment."
fi

