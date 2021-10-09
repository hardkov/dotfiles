# variables definitions
DOTFILES_ROOT="."

OH_MY_ZSH_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
POWERLEVEL_URL="https://github.com/romkatv/powerlevel10k.git"
ZSH_VI_MODE_URL="https://github.com/jeffreytse/zsh-vi-mode"

# oh-my-zsh this installer overwrites .zshrc
sh -c "$(wget -O- $OH_MY_ZSH_URL)"

# clone .zshrc now as oh-my-zsh installer overwrites .zshrc 
cp "$DOTFILES_ROOT/zsh/.zshrc" ~/.zshrc

# zsh-vi-mode
git clone $ZSH_VI_MODE_URL $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode

# powerlevel
git clone --depth=1 $POWERLEVEL_URL ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k