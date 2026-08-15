export ZSH="$HOME/.oh-my-zsh"
export ZSH_PROFILE="$HOME/.zsh_profile"

ZSH_THEME="muse"

# skip completion dir security audit (~10–15ms)
ZSH_DISABLE_COMPFIX=true
# git prompt: ignore untracked files when deciding dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# must be set before oh-my-zsh.sh (update check + nvm plugin)
zstyle ':omz:update' mode disabled
zstyle ':omz:plugins:nvm' lazy yes

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
    zsh-z
    zsh-git-fzf
    zsh-fzf-history-search
    fzf-tab
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $ZSH_PROFILE
