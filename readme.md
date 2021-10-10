## Linux & Windows dual boot

Prepare:
- Bootable devices with win 10 and ubuntu 20. Startup disk creator for ubuntu and rufus for windows.
- Access to internet
- Access to power

### Windows

#### OS

- Plug in bootable device
- Enter installation wizard
- Remove all partitions
- Create a reasonable sized partition (110GB) from unused space and leave rest for linux
- Windows will create several other partitions for its own use. Choose the primary one and start installation

#### Setup

- Log in to microsoft account, disabling most of services.
- Download google chrome:
  - Set the option that reopens tab after closing the browser
  - Install vimium extension
  - Install adblock extension

### Linux

#### OS

- Plug in bootable device
- Reboot and try to enter installation wizard:
  - There might be several boot options, the one that matches windows boot type (UEFI) should be chosen
  - Remember to disable:
    - Fast startup on windows
    - Secure boot
    - (Optional) "legacy" and "csm" related options in BIOS (if intended to boot with UEFI)
  - If installation is not opening try to remove everything connected by usb-c
  - If message about only bios partition of size min 1mb appears that means that installation media booted in wrong type
  - Boot mode of installation media can be checked by "try ubuntu" and looking for /sys/firmware/efi directory. If it is present - it booted with UEFI
- Set Polish keyboard layout
- Partitioning:
  - Root: 20 - 30GB
  - Swap: 16GB (size of RAM)
  - Boot: 1GB, worth creating as:
    - System boots quicker (quick files systems checks)
    - It is easier to apply some fancy file systems, encription
    - Less chance to accidentally overwrite bootloader
  - Home: All that left
  - Note that in case of low disk space one can get by only with / and swap
- Complete installation

#### Setup
**When using tmux-yank with zsh-vi-mode remember to paste from clipboard while in insert mode. Otherwise "g" letters will be removed from the content.**

##### Basics

- Download chrome:
  - `sudo dpkg -i {package.deb}`
  - Set the option that reopens tab after closing the browser
  - Install vimium extension
- Download discord
  - `sudo dpkg -i {package.deb}`
  - If there are problems with dependencies (dpkg does not install them) `sudo apt --fix-broken install`
- Remove all icons from favourites on the left of the screen
- Download 4 recommended fonts from https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k and install them (by double clicking)
- Install git:
  - `sudo apt install git`
  - Add github ssh keys (~/.ssh directory):
    - `ssh-keygen -t ed25519 -C "your_email@example.com"`
    - add .pub key to github (can also invalidate the previous one if not used)

##### Quick install
- Setup repo
  - `git clone git@github.com:hardkov/dotfiles.git && cd dotfiles`
  - `chmod u+x install.sh`
  - `chmod u+x oh-my-zsh.sh`
- `./install.sh`
- `reboot`
- Open terminal and quit the zsh configuration wizard
- Run `./oh-my-zsh.sh` and after new zsh loads exit it (remaining files will download then)
- Open terminal and install tmux plugins with prefix + I

##### Accounts

- Log into all accounts:
  - Poczta agh
  - Wirtualna uczelnia
  - Google (Gmail)
  - Linkedin
  - Facebook, Messenger
- Bookmark most frequently used pages
- Toogle "show bookmark option"

##### Manual install

- Install vim:
  - `sudo apt install vim`

- Install git:
  - `sudo apt install git`
  - Add github ssh keys (~/.ssh directory):
    - `ssh-keygen -t ed25519 -C "your_email@example.com"`
    - Add .pub key to github (can also invalidate the previous one if not used)

- Install zsh:
  - `sudo apt install zsh`
  - `chsh -s $(which zsh)`
  - `reboot`
  - Configuration wizard can be cancelled as it will be overwritten anyway
  - Install oh-my-zsh:
    - `sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

- Install powerlevel10k:
  - `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
  - Put `ZSH_THEME="powerlevel10k/powerlevel10k"` in ~/.zshrc (if not using saved config)
  - Download 4 recommended fonts from https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k and install them (by double clicking)
    - Chose one of this font (regular) in terminal, remove bell sound and change terminal color to solarized dark OR
    - Load saved profile: `dconf load '/org/gnome/terminal/legacy/profiles:/' < "$DOTFILES_ROOT/keybindings/gnome-terminal-profiles.dconf"`
  - Open configuration wizard (`p10k configure`) or use predefined file (`.p10k.zsh`)

- Install zsh-vi-mode plugin:
  - `git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH/custom/plugins/zsh-vi-mode`
  - Append `zsh-vi-mode` to zsh plugins (if not using saved config)

- Install tmux:
  - `sudo apt install tmux`
  - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
  - copy `.tmux.conf` file or create one from scratch
  - Install tmux-yank dependencies (`sudo apt-get install xclip`)
  - Install tmux plugins with prefix + I

- Install vscode:
  - `sudo snap install --classsic code`
  - Install all extensions from file (copy cat output)
  - Copy settings to `~/.config/Code/User/settings.json`

- Key shortcuts
  - Import shortcuts from file:
    - `dconf load '/org/gnome/desktop/wm/keybindings/' < keybindings.dconf`
    - `dconf load '/org/gnome/mutter/keybindings/' < keybindings-mutter.dconf`
    - `dconf load '/org/gnome/settings-daemon/plugins/media-keys/' < keybindings-media-keys.dconf`
  - OR set them manually

#### Updating files
- If URLs to external resources change, update them in both scripts
- Key shortcuts & terminal profiles:
  - `dconf dump '/org/gnome/desktop/wm/keybindings/' > keybindings.dconf`
  - `dconf dump '/org/gnome/mutter/keybindings/' >  keybindings-mutter.dconf`
  - `dconf dump '/org/gnome/settings-daemon/plugins/media-keys/' >  keybindings-media-keys.dconf`
  - `dconf dump '/org/gnome/terminal/legacy/profiles:/' > gnome-terminal-profiles.dconf`
  - When tryging to figure out dconf schema use dconf-editor
- VScode extension:
  - `code --list-extensions | xargs -L 1 echo code --install-extension > extensions.txt`

#### Keybindings

- Window:
  - left-side `ctrl + h`
  - right-side `ctrl + l`
- Screens:
  - Full screen `ctrl + shift + k`
  - Previous display `ctrl + shift + h`
  - Next display `ctrl + shift + l`
  - Lock screen `ctrl + alt + q`

**#TODO**
- The same for mac
- Instruction how to update files in this repo
- Uninstaller
- Automate font installing
- SDKMAN?
- nvm?

