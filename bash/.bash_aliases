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
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## other aliases
alias c='clear'
alias x=extract
alias myip="curl http://ipecho.net/plain; echo"
alias runp="lsof -i "

kill_process_on_port() {
    if [ ! $# -eq 1 ]
    then
        echo "No port was supplied"
        echo "e.g. kill_process_on_port 3000"
        return -1
    fi
    port=$1
    command="kill -9 \$(lsof -t -i:$port)"
    eval $command
}
