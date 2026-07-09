# AGENTS.md

## Overview

Personal dotfiles synced with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level folder (`nvim/`, `i3/`, `zsh/`, etc.) mirrors paths under `$HOME` and is symlinked via `./install`.

-   `DOTFILES` — repo root (default: `$HOME/dotfiles`)
-   `STOW_FOLDERS` — comma-separated stow packages (defined in `install` and `zsh/.zsh_profile`)

## Commands

| Action           | Command                    |
| ---------------- | -------------------------- |
| Install / restow | `./install`                |
| Unstow           | `./unstow`                 |
| Format           | `npm ci && npm run format` |
| Reload i3        | `i3-msg reload`            |

## Layout

Stow packages: `bin`, `bash`, `docker`, `dunst`, `git`, `i3`, `picom`, `kitty`, `tmux`, `nvim`, `rofi`, `zsh`.

Convention: `<package>/<home-relative-path>/...` (e.g. `nvim/.config/nvim/init.lua` → `~/.config/nvim/init.lua`).

Neovim uses lazy.nvim; plugins live in `nvim/.config/nvim/lua/plugins/`.

## Conventions

-   Shell scripts: `#!/usr/bin/env zsh`
-   Lua: 4-space indent (stylua), one plugin per file under `lua/plugins/`
-   i3: assign windows with `assign [class="..."] $wsN` — get the class via `xprop` (second value in `WM_CLASS`)
-   Formatting: Prettier for JS/JSON/MD etc. (excludes `*.yaml`/`*.yml`); stylua for Lua
-   New stow package: add the folder and update `STOW_FOLDERS` in both `install` and `zsh/.zsh_profile`

## Boundaries

**Always:** preserve stow layout; run `npm run format` after editing Prettier-covered files; match existing color schemes and keybindings.

**Never:** commit secrets; modify live `~` configs directly (use stow); change `lazy-lock.json` unless updating Neovim plugins; add npm dependencies without reason.

**Ask first:** adding/removing stow packages; changing CI workflows.

## Validation

No automated tests. After changes: `./install` (symlinks), `i3-msg reload` (i3), `:checkhealth` (nvim), `source ~/.zshrc` (shell).

See `README.md` for i3 monitor setup and color scheme notes.
