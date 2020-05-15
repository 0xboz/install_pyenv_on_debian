# Automated Installation Script: pyenv on Debian-based OS

This script is primarily based on [pyenv-installer](https://github.com/pyenv/pyenv-installer). However,
additional features are tailored to Debian-based Os.  

## Features

* The prerequisites installation (for Debian-based systems) has been added.  
* Environment variables are added automatically at the end of the installation.

## How-to

```shell
sudo apt install -y curl && curl https://raw.githubusercontent.com/0xboz/install_pyenv_on_debian/master/install.sh | bash
```

## Note

Close the current terminal and start a new one. Or run the following in the current terminal:

```shell
exec $SHELL
```
