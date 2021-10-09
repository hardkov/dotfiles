## Linux & Windows dual boot

...

### Windows

#### OS

...

#### Programs

...

### Linux

#### OS

#### Programs

##### In terminal

- Install vim:
  - `sudo apt install vim`
- Pobrać gita:
  - Sudo apt install git
  - Klucze ssh do githuba: W .ssh trzeba dodać klucz pobrany z girhuba (można wygenerowac jeszcze raz)
- Instalacja zsh:
  - Sudo apt install zsh
  - Chsh -s $(which zsh)
  - Reboot
  - Konfiguracyjny wizard lub gotowy plik .zshrc (trzeba zaktualizować repo)
  - Instalacja oh-my-zsh
    - sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
- Instalacja powerlevel10k

  - git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  - ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc (powinno być w pliku)
  - Pobrać 4 fonty z https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k i zainstalować je
  - Wybrać fonty w terminalu, usunąć dzwonek w terminalu i zmienić kolor terminala na solarized dark
  - Konfiguracyjny wizard lub pobrane z pliku (zaktualizować repo) - P10k configure

- Zsh vi mode imporoved

  - git clone https://github.com/jeffreytse/zsh-vi-mode \ \* $ZSH/custom/plugins/zsh-vi-mode
  - plugins+=(zsh-vi-mode)

- Tmux

  - Sudo apt install tmux
  - git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  - Copy config .tmux.conf
  - Install tmux-yank dependencies (sudo apt-get install xclip)
  - Install plugins with prefix + I

- Vscode:
- Sudo snap install --classsic code
- Install all extensions from file (copy cat output)
- Copy settings to ~/.config/Code/User/settings.json

- Key shortcuts
  - Import shortcuts from file:
  - dconf load '/org/gnome/desktop/wm/keybindings/' < keybindings.dconf
  - dconf load '/org/gnome/mutter/keybindings/' < keybindings2.dconf

##### Manually

- Chrome:
  - Pobrać .deb ze strony
  - Sudo dpkg -i <pakydż>
  - Ustawić żeby taby się otwierały po zamknięciu
  - Vimium zainstalować
- Zainstalować discorda
  - Pobrać .deb
  - Sudo dkpg - i <paczka>
- Discord
  - Pobrać paczke z neta
  - Sudo dpkg -i <paczka>
  - Czasami brakuje jakis zaleznosci ale i tak działa
- Wszystko wywalić z favourites z lewej strony ekranu
- Zmienić keyboard layout na polski:
  - Settings -> Regions & Language -> usunąć US i dodać polish
- Zalogować się na wszystkie konta i ewentualnie zbookmarkować
  - Poczta agh
  - Google (Gmail)
  - Linked in

# Combined into script

## Code

```sh
# basic programs
sudo apt install vim
sudo apt install git

# zsh
Sudo apt install zsh
Chsh -s $(which zsh)
cp .zshrc .zshrc #TODO

# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-vi-mode
git clone https://github.com/jeffreytse/zsh-vi-mode \ $ZSH/custom/plugins/zsh-vi-mode

# tmux
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf .tmux.conf #TODO
sudo apt-get install xclip

# vscode:
sudo snap install --classsic code
Install all extensions from file (copy cat output) #TODO
cp settings.json ~/.config/Code/User/settings.json #TODO

# key shortcuts
dconf load '/org/gnome/desktop/wm/keybindings/' < keybindings.dconf
dconf load '/org/gnome/mutter/keybindings/' < keybindings2.dconf

# reboot at the end
reboot
```

## Actions

- Terminalowy stuff
  - Pobrać 4 fonty z https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k i zainstalować je
  - Wybrać fonty w terminalu (MesloLGS NF Regular), usunąć dzwonek w terminalu i zmienić kolor terminala na solarized dark
- Install gita
- Klucze ssh do githuba: W .ssh trzeba dodać klucz pobrany z girhuba (można wygenerowac jeszcze raz)
- git clone dotfiles
- nadać prawa dostępu do skryptu jednego i drugiego
- run script
- reboot
- nie rób nic w konfiguracyjnym wizardzie
- run script 2, trzeba dac exit z nowego zsh żeby zaczęły się pobierać rzeczy
  - Konfiguracyjny wizard lub pobrane z pliku (zaktualizować repo) - P10k configure
- Install tmux plugins with prefix + I
- Chrome:
  - Pobrać .deb ze strony
  - Sudo dpkg -i <pakydż>
  - Ustawić żeby taby się otwierały po zamknięciu
  - Vimium zainstalować
- Zainstalować discorda
  - Pobrać .deb
  - Sudo dkpg - i <paczka>
- Discord
  - Pobrać paczke z neta
  - Sudo dpkg -i <paczka>
  - Czasami brakuje jakis zaleznosci ale i tak działa
- Wszystko wywalić z favourites z lewej strony ekranu
- Zmienić keyboard layout na polski:
  - Settings -> Regions & Language -> usunąć US i dodać polish
- Zalogować się na wszystkie konta i ewentualnie zbookmarkować
  - Poczta agh
  - Google (Gmail)
  - Linked in

Moje keybindingi (linux)
Pozycjonowanie okna na jednym ekranie
Lewa ctrl + h
Prawa ctrl + l
Full ctrl + shitft + k
Pozycjonowanie okna między ekranami
Poprzedni ekran ctrl + shift + h
Następny ekran ctrl + shitft + l

# TODO

- refine (na angielski tez) runbooku
- refine (na angielski też) akcji
- dodać instalacje systemu
- keybindingi
- dodać instrukcje jak updatować runbook
- refactor skryptu
- skrypt do odinstalowywania
- automate font installing
