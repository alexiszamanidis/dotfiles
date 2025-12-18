# Directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# List commands
alias ls="ls --color=auto"
alias ll="ls -lah"
alias l.="ls -d .* --color=auto"
alias lsize="ls -laSh"

# Grep with color
alias grep="grep --color=auto"

# Use bat for cat
alias cat="bat --paging=never --style=plain"
# Use $VIM for vim
alias vim="$VIM"

# Miscellaneous
alias c="clear"
alias cc="clear && printf '\e[3J'"
alias open="xdg-open"

# Add to PATH if not already present
add_to_path() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}
