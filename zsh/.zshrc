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
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
    zsh-git-fzf
)

source $ZSH/oh-my-zsh.sh
source $ZSH_PROFILE
