export ZSH="$HOME/.oh-my-zsh"
export ZSH_PROFILE="$HOME/.zsh_profile"

ZSH_THEME="muse"

plugins=(
    # docker
    # docker-compose
    # extract
    git
    # python
    # npm
    # yarn
    sudo
    # web-search
    # history
    # jsontools
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
    zsh-git-fzf
)

source $ZSH/oh-my-zsh.sh
source $ZSH_PROFILE
