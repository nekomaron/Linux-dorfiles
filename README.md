This repository contains nekomaron's dotfiles.
 
First, after cloning this repository, modify the files in HOME/.dotfiles.
# Arch install
|Section|Config|
|---|---|
|Disk configuration|Btrfs|
|Bootloader|system|
|Root Password|**Setting**|
|User account|need sudo|
|Profile|Minimal|
|Addtional Package|plasma-desktop dolphin sddm networkmanager kitty firefox bluez bluez-utils nvidia-open nvidia-utils git sudo|
|Networking configuraiton|NetworkManager|

After installed 
```bash
sudo systemctl enable sddm
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
```

# Ansible
## Installing the Ansible Core Components
```bash
sudo pacman -S ansible
```
```bash
ansible-galaxy collection install community.general
```

## Performing a Dry Run for Testing
```bash
cd ~/.dotfiles/ansible
```
```bash
ansible-playbook -i inventory.ini playbook.yml --check --diff --ask-become-pass
```

# rcm
rcm allows you to manage configuration files stored in your dotfiles.
You should have completed the installation using Ansible. If not, please do so from there.

After installation, place your configuration files directly in HOME:
```bash
cp ~/.dotfiles/rcrc ~/.rcrc
```
Then apply the changes:
```bash
rcup
```
Alternatively, if you want to apply only specific files, use the following command:
```bash
rcdn -t kitty
```

# Nix(Home-manager)
## install Nix
```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```
reload zsh
```bash
exec zsh
```
Check
```bash
nix --version
```

## Enable Flake
```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

## home-manager
```bash
nix run github:nix-community/home-manager -- switch --flake .#nekomaron
```
```bash
home-manager switch --flake ~/.dotfiles/nix#nekomaron
```

