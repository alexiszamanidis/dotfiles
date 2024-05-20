export ZSH="$HOME/.oh-my-zsh"
export ZSH_PROFILE="$HOME/.zsh_profile"

ZSH_THEME="muse"

plugins=(
    # docker
    # docker-compose
    # extract
    # python
    # npm
    # yarn
    # web-search
    # history
    # jsontools
    git
    nvm
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
    zsh-git-fzf
    zsh-fzf-history-search
)

source $ZSH/oh-my-zsh.sh
source $ZSH_PROFILE
