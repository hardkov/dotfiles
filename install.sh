# variables definitions
DOTFILES_ROOT = "."

OH_MY_ZSH_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
POWERLEVEL_URL="https://github.com/romkatv/powerlevel10k.git"
ZSH_VI_MODE_URL="https://github.com/jeffreytse/zsh-vi-mode"
TPM_URL="https://github.com/tmux-plugins/tpm"

# basic programs
sudo apt install vim

# oh-my-zsh
sh -c "$(wget -O- $OH_MY_ZSH_URL)"
git clone --depth=1 $POWERLEVEL_URL ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-vi-mode
git clone $ZSH_VI_MODE_URL \ $ZSH/custom/plugins/zsh-vi-mode

# tmux
sudo apt install tmux
git clone $TPM_URL ~/.tmux/plugins/tpm
cp "$DOTFILES_ROOT/tmux/.tmux.conf" ~/.tmux.conf 
sudo apt-get install xclip 

# vscode:
sudo snap install --classsic code
Install all extensions from file (copy cat output) #TODO
cp "$DOTFILES_ROOT/vscode/settings.json" ~/.config/Code/User/settings.json

# key shortcuts
dconf load '/org/gnome/desktop/wm/keybindings/' < keybindings.dconf
dconf load '/org/gnome/mutter/keybindings/' < keybindings2.dconf

# zsh
sudo apt install zsh
cp "$DOTFILES_ROOT/zsh/.zshrc" ~/.zshrc
chsh -s $(which zsh)

# reboot at the end
# reboot