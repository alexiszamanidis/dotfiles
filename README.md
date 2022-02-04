## Dotfiles

A lot of software programs store their configuration settings in plain, text-based files or directories.

Dotfiles are configuration files for various programs and they help those programs manage their functionality.

This repository synchronizes a new Ubuntu System with the dotfiles that I am currently using

-   Bootstrap your new Ubuntu System
-   Never reconfigure your System ever again

### Reminders

-   STOW_FOLDERS variable is defined in install and .zshrc files
-   i3

    -   monitors
        -   type `xrandr` to find the hotkeys of the monitors
        -   update the variables(firstMonitor, secondMonitor) in i3/.config/i3/config
    -   workspaces
        -   type `xprop` and click on an application you want to bind with a specific workspace
        -   pick the name next to `WM_NAME(STRING) =` and use it in i3/.config/i3/config

-   Upstream submodule
    -   Related files/folders:
        -   upstream folder
        -   .gitsubmodule: upstream submodule
        -   .zshrc: 'upstream/.upstream_aliases'

### Clone and Install

```
sudo apt install -y git-all && \
git clone https://github.com/alexiszamanidis/dotfiles.git ~/dotfiles && \
cd $HOME/dotfiles && \
chmod +x install stow unstow && ./install
```

### Scripts

`update_and_clean_up`

Updates and cleans up the system

Alias:

```
update_and_clean_up
```

| Name   | Flag | Default | Description                                        |
| ------ | ---- | ------- | -------------------------------------------------- |
| VSCODE | \-v  | false   | This option is used for updating vscode extensions |

### Ansible

You can check out my [Ansible repository](https://github.com/alexiszamanidis/ansible) that installs many useful packages and applications. I combine these two repositories to set up a new Ubuntu System.
