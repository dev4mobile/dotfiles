# If you come from bash you might have to change your $PATH.
export TERM="xterm-256color"
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/dev4mobile/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git z extract zsh-autosuggestions osx brew npm docker tmux fzf navi iterm2
)

prepend() { [ -d "$2" ] && eval $1=\"$2':'\$$1\" && export $1; }

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "/Users/dev4mobile/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dev4mobile/.sdkman/bin/sdkman-init.sh"

#ENV
export DEV="$HOME/develop"

#Java
#export JAVA_HOME=~/.sdkman/candidates/java/current
#export PATH=$PATH:$JAVA_HOME/bin
#prepend JAVA_HOME ~/.sdkman/candidates/java/current
prepend PATH $JAVA_HOME/bin

#Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/build-tools/28.0.2

#Cmake
export PATH=$PATH:$ANDROID_HOME/cmake/3.6.4111459/bin

#Ndk
export NDK=$ANDROID_HOME/ndk-bundle
export PATH=$PATH:$NDK

#gradle
export GRADLE_USER_HOME=~/.gradle

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#flutter
export FLUTTER_ROOT=~/Library/flutter
export PATH=$PATH:$FLUTTER_ROOT/bin

#autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#go develop dir
export GO111MODULE=on
export GOPROXY=https://goproxy.io
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

#nvm
export NVM_DIR="/Users/dev4mobile/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#conda
#export PATH=/anaconda3/bin:$PATH

#zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

#jmeter
export PATH=~/apache-jmeter-5.0/bin:$PATH

#ruby
export PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH
alias lzd='lazydocker'
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

#proxy
function proxy_off() {
  unset http_proxy	
  unset https_proxy
  echo -e "[proxy off]"
  curl ip.gs
}

#ifconfig | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1' | sed '1 d' | head -n1
function proxy_on() {
  ip="ifconfig | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1' | sed '1 d' | head -n1"
  b=eval $ip	
  echo $b 
  export http_proxy='http://127.0.0.1:1087'
  export https_proxy=$http_proxy
  echo -e "[proxy on]"
  curl ip.gs
}

#chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

#python3
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3

#git
git_prompt_stash() {
  if [[ -n $(git stash list 2> /dev/null) ]]; then
    echo "%{$fg[cyan]%}$"
  fi
}
RPROMPT="$(git_prompt_stash)"

# navi
source "$(navi widget zsh)"

#cargo
export PATH="$HOME/.cargo/bin:$PATH"

#alias
alias workspace="cd $DEV/workspace"
alias company="cd $DEV/company"
alias dev="cd $DEV"

#thefuck
eval $(thefuck --alias f)
