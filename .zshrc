alias pam="sudo pacman"
alias vv="v ~/.vimrc"
alias vz="v ~/.zshrc"
alias vm="v ~/.xmonad/xmonad.hs"

alias dots='yadm'
alias dotss="dots status"
alias dotsa="dots add"
alias dotsc="dots commit -m"
alias dotsC="dots checkout"
alias dotsR="dots reset --hard"
alias dotsp="dots push"
alias dotsb="dots branch"
alias dotsd="dots diff"
# [ -d $HOME/.dots ] && dots config --local status.showUntrackedFiles no

export PATH="$PATH:$HOME/rei/cool-shit/"
# [[ -d ~/.local/scripts ]] && source ~/.local/scripts/*.sh
# Source my functions
# Custom commands
alias ls="ls --color"
alias neofetch="neofetch --ascii ~/.config/neofetch/mona-china"
alias ports="sudo lsof -i -P -n | grep -i listen"
alias gd="git diff"
alias gl="git log"
alias gR="git reset --hard"
alias gCC="git clean -fd"
alias gp="git push"
alias gs="git status"
alias ga="git add ."
alias gA="git add "
alias gc="git commit -m"
alias wifi="~/.scripts/wifi.sh"
alias s="./sync.sh"
alias t="tmux"
alias n="nordvpn"
alias ns="nordvpn status"
alias nc="nordvpn connect"
alias nd="nordvpn disconnect"
alias getbat="acpi | awk -F ',' '{print \$2}'"
alias lisp="clisp"
alias lispw="nodemon --exec 'clisp -i'"
alias npmd="npm run dev"
alias npms="npm start"
alias npmt="npm run test"
alias npmb="npm run build"
alias npmi="npm install"
alias k="kubectl"
alias drun="deno run --unstable --watch"
alias python="python3"
alias kill_kitties="~/.local/scripts/kill_kitties $PPID"
alias rp="~/.local/start_scripts/picom_autostart.sh"
alias vsync="rm ~/.vimrc && cp .vimrc ~"
alias cd-="cd -"
alias artisan="php artisan"
alias mysql="mysql -u root -p"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias rain="rain.sh"
alias icat="kitty +kitten icat"
alias explorer="xdg-open ."
alias please="sudo"
alias die="exit"
alias cd..="cd .."
alias howisthemoon="curl 'wttr.in/Moon'"
alias weather="curl 'wttr.in/Guadalajara, Mexico'"
alias pwsh="pwsh -NoLogo"
alias scan="sudo nmap -sn 192.168.0.5/24"
alias v="nvim"
# Python activate virtual env shortcut
#alias activate="source bin/activate"

search-js() {
  grep -in $2 $(find $1 -type f -name "*.js")
}

ok_computer() {
  echo "$fg[magenta]>$reset_color Happier";
  echo "$fg[magenta]>$reset_color More productive";
}
alias fitter="ok_computer"
get_moon() {
  EMOJI="$(curl -s --write-out "%{http_code}" 'wttr.in/Guadalajara, Mexico?format=%m' | cut -c1-7)"
  if [[ $EMOJI != *"200"* ]]
  then
    echo '👽'
  else 
    echo "$(echo $EMOJI | cut -c1-4)"
  fi
}
get_weather() {
    echo "$(curl -s 'wttr.in/Guadalajara, Mexico?format=%c%t')" | cut -c1-11
}
# W_RES=$(get_weather)
# export WEATHER=$(echo $W_RES | cut -c1-4)
# export TEMP=$(echo $W_RES | cut -c7-10)
# export MOONPHASE=$(get_moon)

# unalias run-help
autoload run-help

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="rei"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git nvm)
plugins=(nvm vi-mode)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# jeje
PS2='... '
export prompt_icon="%{$fg[magenta]%}λ%f"
# export prompt_icon="%{$fg[magenta]%}>%f"
dollar() {
    prompt_icon="%{$fg[green]%}$%f"
}
lambda() {
    prompt_icon="%{$fg[magenta]%}λ%f"
}

# help :(

export VISUAL=nvim
export EDITOR="$VISUAL"

# export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

export PATH=$PATH:$HOME/.config/composer/vendor/bin

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/bellsoft-java8-amd64

export PATH=$PATH:$HOME/.yarn/bin

alias emu="emulator @Pixel"
export DENO_INSTALL="/home/mluna/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export SPICETIFY_INSTALL="/home/mluna/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

# npm global
export NPM_PACKAGES=$HOME/.npm-packages
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export PATH=$PATH:/usr/local/go/bin:$HOME/.intelliJ/bin

# Blur {{{
if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|kitty$' ]]; then
  for wid in $(xdotool search --pid $PPID); do
    xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi
# }}}

export PYTHONPATH=/usr/share/python3

# export WORKON_HOME=~/Envs
# mkdir -p $WORKON_HOME
# source ~/.local/bin/virtualenvwrapper.sh
# eval "$(starship init zsh)"
alias rice='curl -L rum.sh/ricebowl'
alias rice='curl -L git.io/rice'

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

export VI_MODE_SET_CURSOR=true
export MODE_INDICATOR="%F{yellow}[NORMAL]%f"
export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# setopt PROMPT_SUBST
# export TMOUT=1

# TRAPALRM() {
#   zle reset-prompt
# }

# bindkey "^P" up-line-or-search
# bindkey "^N" down-line-or-search
# bindkey "^A" vi-beginning-of-line
# bindkey "^E" vi-end-of-line

# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# eval $(minikube docker-env)

# symfony
export PATH="$PATH:$HOME/.symfony/bin"

# bc why not
# neofetch

zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit

export PATH=$PATH:/$HOME/.emacs.d/bin
