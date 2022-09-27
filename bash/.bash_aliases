## cd aliases
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## ls aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

## grep aliases
alias grep='grep --color=auto'

## override
alias cat="bat"
alias vim="$VIM"

## other aliases
alias c='clear'
alias x=extract
alias myip="curl http://ipecho.net/plain; echo"
alias runp="lsof -i "
alias open="xdg-open $1"

# this alias is used to open settings on i3wm
# TODO: is there a better way to do this?
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

add_to_path() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}
