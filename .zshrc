# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/michaelbush/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# liked so far: 'bira', 'wuffers', 'garyblessington', 'simple'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

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

# This stuff used by /bp/cucumber-blueprint
alias copyusers='mmv -c "config/environments/*.yml.example" "config/environments/#1.yml"'
alias cukeadmin='export VALID_PASSWORD="p4ssword"; export INVALID_PASSWORD="notapass"; export AUTH_TOKEN="{2voG6L/XmS02pBDWo6mQCGwtO1jPPyvjeJ3b8Xoi}"'

# This line sets up some useful aliases and helpers for benchPrep
source "/Users/michaelbush/projects/bp/infrastructure/shell-includes/helpers"

# This next line is used by rbenv (ruby version manager)
eval "$(rbenv init -)"

# assorted helpers
alias prmt="pry-remote -w"

alias d="docker"
alias dc="docker-compose"
alias deit="docker exec -it"
alias dps="docker ps -a --format 'table{{ .ID }}\t{{ .Status }}\t{{ .Ports }}\t{{ .Names }}'"
alias wdps="watch docker ps -a --format 'table{{ .ID }}\t{{ .Status }}\t{{ .Ports }}\t{{ .Names }}'"

alias be="bundle exec"
alias ber="bundle exec rspec"
alias bek="bundle exec rake"

alias v2="cd /Users/michaelbush/projects/bp/benchprep-v2"
alias console="cd ~/projects/bp/benchprep-console"
alias infra="cd /Users/michaelbush/projects/bp/infrastructure"
alias support="cd /Users/michaelbush/projects/bp/benchprep-support"
export PATH="/usr/local/sbin:$PATH"

function dev-locales () {
  docker exec benchprep-v2 bundle exec rake locales:import_deploy
  docker exec benchprep-v2 bundle exec rails runner "Benchprep::Locales::CacheUpdater.new('benchprep', 'en-us').run"
}

function v2-prep () {
  echo "\nSTEP 1: bundle\n"
  docker exec benchprep-v2 bundle
  echo "\nSTEP 2: db:migrate\n"
  docker exec benchprep-v2 bundle exec rake db:migrate
  echo "\nSTEP 3: db:test:prepare\n"
  docker exec benchprep-v2 bundle exec rake db:test:prepare
  echo "\nSTEP 4: db:repair_sequences\n"
  docker exec benchprep-v2 bundle exec rake db:repair_sequences
  echo "\nSTEP 5: onesie:run_all\n"
  docker exec benchprep-v2 bundle exec rake onesie:run_all
}

# The next line is used by BenchPrep's V2 repo
export PROJECT_DIR="/Users/michaelbush/projects/bp"

# docker compose concierge
alias dcc="$PROJECT_DIR/infrastructure/dev/dcc"

# Just for reference, the conditional to detect for m1 architecture:
# WMX/infrastructure docker setup (see doc/how_to_guides/dev_containers/set_up_guide.md)
# __is_apple_m1() {
#   [[ "$(type arch)" > /dev/null ]] && [[ "$(arch)" == "arm64" ]]
# }

# if __is_apple_m1; then
#   export DOCKER_DEFAULT_PLATFORM=${DOCKER_DEFAULT_PLATFORM:-'linux/arm64'}
# fi
export DOCKER_DEFAULT_PLATFORM=${DOCKER_DEFAULT_PLATFORM:-'linux/arm64'}

export MAIL_SAFE_EMAIL="mbush@benchprep.com"
