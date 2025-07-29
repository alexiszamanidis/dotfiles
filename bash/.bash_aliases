## cd aliases
alias ..="cd .."
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias .....="cd ../../../../"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../.."

## ls aliases
alias ls="ls --color=auto"
alias ll="ls -la"
alias l.="ls -d .* --color=auto"
alias l-size="ls -laSh"

## grep aliases
alias grep="grep --color=auto"

## override
alias cat="bat --paging=never --style=plain"
alias vim="$VIM"

## other aliases
alias c="clear"
alias cc="c && printf '\e[3J'"
alias open="xdg-open $1"
alias find-file="find . -name $1"

add_to_path() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}
