# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/michaelbush/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# liked so far: 'bira', 'wuffers', 'garyblessington', 'simple', 'robbyrussell'

# Which plugins would you like to load?
plugins=(
  git
  docker
)

export PATH="/usr/local/sbin:$PATH"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Vim key bindings
bindkey -v

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Git aliases
alias gcanv="git commit --amend --no-verify"
alias gsmu="git submodule update"
alias gap="git add -p"
alias gsd="git stash drop"
alias gss="git ss"
alias gsap="git checkout -p stash@{0}"
alias gsp="git stash pop"
alias gcop="gco -p"
alias gsl="git stash list"
alias gsiu="git stash --include-untracked"

# Enable go modules feature
export GO111MODULE=on
# Set the GOPROXY env variable
export GOPROXY="https://goproxy.io"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/michaelbush/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/michaelbush/Downloads/google-cloud-sdk/path.zsh.inc'; fi

export PATH="/Users/michaelbush/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Educational - Professional Development
#
# For High Performance PostgreSQL for Rails
export DATABASE_URL="postgres://owner:@localhost:6432/rideshare_development"
export DB_URL="postgres://postgres:@localhost:6432/postgres"

# Set PGDATA for pg_ctl
# export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# export PGDATA="$(psql -U postgres \
#   -p 6432 \
#   -c 'SHOW data_directory' \
#   --tuples-only | sed 's/^[ \t]*//')"
  # echo "Set PGDATA: $PGDATA"

export PATH="/Users/michaelbush/Library/Python/3.9/bin:$PATH"

# Makes pipx (python) installed packages available in the PATH
export PATH="/Users/michaelbush/.local/bin:$PATH"

# Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# BenchPrep helpers
source "/Users/michaelbush/.dotfiles/.benchprep"

# For terraform
# (see: https://github.com/warrensbox/terraform-switcher/issues/219#issuecomment-1105757975 )
export PATH="$PATH:/Users/michaelbush/bin"
