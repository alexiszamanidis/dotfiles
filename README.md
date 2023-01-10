## Dotfiles

This repository synchronizes the dotfiles that I am currently using

### Reminders

-   STOW_FOLDERS variable is defined in install and .zsh_profile files
-   i3

    -   monitors
        -   type `xrandr` to find the hotkeys of the monitors
        -   update the variables(firstMonitor, secondMonitor) in i3/.config/i3/config
    -   workspaces
        -   type `xprop` and click on an application you want to bind with a specific workspace
        -   pick the name next to `WM_NAME(STRING) =` and use it in i3/.config/i3/config

-   When .editorconfig is not working run the following commands

    -   ```bash
        # (Node should be installed!)
        # check which files need to be fixed
        npx eclint check '.'
        # fix these files
        npx eclint fix '.'
        ```

-   Color schemes

    -   vscode, dunst, kitty, nvim, rofi, wsl, git
