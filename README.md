## Dotfiles

A lot of software programs store their configuration settings in plain, text-based files or directories.

Dotfiles are configuration files for various programs and they help those programs manage their functionality.

This repository synchronizes a new Ubuntu System with the dotfiles that I am currently using

-   Bootstrap your new Ubuntu System
-   Never reconfigure your System ever again

### Clone and Install

```
sudo apt install -y git-all && \
git clone https://github.com/alexiszamanidis/dotfiles.git ~/dotfiles && \
cd $HOME/dotfiles && \
chmod +x install stow unstow && ./install
```

### Ansible

You can check out my [Ansible repository](https://github.com/alexiszamanidis/ansible) that installs many useful packages and applications. I combine these two repositories to set up a new Ubuntu System.
