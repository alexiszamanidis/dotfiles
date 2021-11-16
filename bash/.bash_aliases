## cd aliases
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## ls aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

## grep aliases
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## other aliases
alias leak='valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes'
alias c='clear'
alias x=extract
alias zshrc='code ~/.zshrc'
alias topten="history | commands | sort -rn | head"
alias myip="curl http://ipecho.net/plain; echo"
alias dirs='dirs -v | head -10'
alias usage='du -h -d1'
alias update="source ~/.zshrc"
alias sshdir="cd ~/.ssh"
alias runp="lsof -i "
alias md="mkdir "
alias h='history'
alias j='jobs -l'
alias settings='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'

kill_process_on_port() {
    if [ ! $# -eq 1 ]
    then
        echo "No port was supplied"
        echo "e.g. kill_process_on_port 3000"
        return -1
    fi
    port=$1
    command="kill -9 \$(sudo lsof -t -i:$port)"
    eval $command
}
