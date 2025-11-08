#!/bin/bash

DOTFILES=(.gitconfig .zshrc)

# Symlink dotfiles
for dotfile in "${DOTFILES[@]}"; do
    ln -sf ~/dotfiles/$dotfile ~/$dotfile
    echo "Linked $dotfile"
done

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages from Brewfile if it exists
if [ -f ~/dotfiles/Brewfile ]; then
    echo "Installing packages from Brewfile..."
    brew bundle --file=~/dotfiles/Brewfile
fi

echo "✅ Dotfiles installation complete!"