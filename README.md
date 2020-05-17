# Automated Installation Script: pyenv on Debian-based OS

This script is primarily based on [pyenv-installer](https://github.com/pyenv/pyenv-installer). However,
additional features are tailored to Debian-based Os.  

## Features

* The prerequisites installation (for Debian-based systems) has been added.  
* Environment variables are added automatically at the end of the installation.

## How-to

### Install

```shell
sudo apt install -y curl && curl https://raw.githubusercontent.com/0xboz/install_pyenv_on_debian/master/install.sh | bash
```

### Uninstall

```shell
curl https://raw.githubusercontent.com/0xboz/install_pyenv_on_debian/master/uninstall.sh | bash
```

#### Note (for installation and removal both)

Close the current terminal and start a new one. Or run the following in the current terminal:

```shell
exec $SHELL
```

## Stay Connected

Join [0xboz's Discord](https://discord.gg/JHt7UQu) and find out more.
