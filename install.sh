# variables definitions
DOTFILES_ROOT="."

TPM_URL="https://github.com/tmux-plugins/tpm"


# key shortcuts
dconf load '/org/gnome/desktop/wm/keybindings/' < "$DOTFILES_ROOT/keybindings/keybindings.dconf"
dconf load '/org/gnome/mutter/keybindings/' <  "$DOTFILES_ROOT/keybindings/keybindings-mutter.dconf"
dconf load '/org/gnome/settings-daemon/plugins/media-keys/' <  "$DOTFILES_ROOT/keybindings/keybindings-media-keys.dconf"
dconf load '/org/gnome/terminal/legacy/profiles:/' < "$DOTFILES_ROOT/keybindings/gnome-terminal-profiles.dconf" 

# basic programs
sudo apt install vim

# tmux
sudo apt install tmux
git clone $TPM_URL $HOME/.tmux/plugins/tpm
cp "$DOTFILES_ROOT/tmux/.tmux.conf" ~/.tmux.conf 
sudo apt-get install xclip 

# vscode:
sudo snap install --classic code

# vscode - extensions
cp "$DOTFILES_ROOT/vscode/extensions.txt" "$DOTFILES_ROOT/tmp_script.sh"
chmod u+x "$DOTFILES_ROOT/tmp_script.sh"
"$DOTFILES_ROOT/tmp_script.sh"
rm "$DOTFILES_ROOT/tmp_script.sh"

# vscode - settings
cp "$DOTFILES_ROOT/vscode/settings.json" ~/.config/Code/User/settings.json

# zsh
sudo apt install zsh
chsh -s $(which zsh)
