export DOTFILES=$HOME/dotfiles
export STOW_FOLDERS="bin,bash,docker,dunst,git,i3,compton,kitty,tmux,nvim,rofi,zsh,work"
export EDITOR="code"
# export PATH=$PATH:~/.local/bin
export ZSH_GIT_FZF_REMOVE_STALLED_BRANCHES="true"

# fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
    OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
    zle -N self-insert url-quote-magic
}
pastefinish() {
    zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

declare -a dotfiles=(".zsh_bindkeys" ".bash_aliases" ".docker_aliases" ".git_aliases" "work/.work_aliases")
# source global aliases
for dotfile in "${dotfiles[@]}"
do
    if [ -f "$HOME/$dotfile" ] ; then
        source "$HOME/$dotfile"
    fi
done

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 100% --layout=reverse --border --preview='bat --style=numbers --color=always --line-range :500 {}'"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# this alias is used to open settings on i3wm
# TODO is there a better way to do this?
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

reload() {
    source $HOME/.zshrc
    source $HOME/.zprofile
}

add_to_path $HOME/.local/bin
add_to_path $HOME/.cargo/bin
add_to_path $HOME/.local/.npm-global/bin
