# Remove fish default greeting
set --erase fish_greeting

# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme mtahmed

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Load paths
. $HOME/.config/fish/functions/cd.fish
. $HOME/.config/fish/functions/git.fish
. $HOME/.config/fish/functions/edit.fish
. $HOME/.config/fish/functions/tree.fish
. $HOME/.config/fish/functions/util.fish
. $HOME/.config/fish/functions/export.fish
. $HOME/.config/fish/functions/aliases.fish
