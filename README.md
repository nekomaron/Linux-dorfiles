This repository contains nekomaron's dotfiles.
 
First, after cloning this repository, modify the files in HOME/.dotfiles.

# How to use rcm
rcm allows you to manage configuration files stored in your dotfiles.
To use it, you first need to install rcm:
```bash
sudo pacman -S rcm
```
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
