# <Config>
autoload run-help
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
export VI_MODE_SET_CURSOR=true
export MODE_INDICATOR="%F{yellow}[NORMAL]%f"
export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
ZSH_THEME="rei"
plugins=(vi-mode)
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
# </Config>

# <Aliases>
# alias neofetch="neofetch --ascii ~/.local/ascii/mewo"
# utils
alias :q="exit"
alias ls="exa --color always --icons"
alias rice='curl -L rum.sh/ricebowl'
alias rice='curl -L git.io/rice'
alias figlet="figlet -f ~/.local/share/fonts/figlet-fonts/smmono12.tlf"
alias cat="bat"
alias p="psql -U postgres"
alias xr="xmonad --recompile && xmonad --restart"
alias ports="sudo lsof -i -P -n | grep -i listen"
alias t="tmux"
alias n="nordvpn"
alias ns="nordvpn status"
alias nc="nordvpn connect"
alias nd="nordvpn disconnect"
alias getbat="acpi | awk -F ',' '{print \$2}'"
alias lisp="clisp"
alias k="kubectl"
alias cd-="cd -"
alias artisan="php artisan"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias icat="kitty +kitten icat"
alias explorer="xdg-open ."
alias please="sudo"
alias die="exit"
alias cd..="cd .."

# scripts
alias mari_says="ruby ~/Repos/mari/mari.rb"

# ruby
alias r="bin/rails"

# node
alias ado="node ace"
alias npmd="npm run dev"
alias npms="npm start"
alias npmt="npm run test"
alias npmb="npm run build"
alias npmi="npm install"
alias yarns="yarn start"
alias yarnb="yarn build"
alias yarni="yarn install"
alias yarna="yarn add"
alias drun="deno run --unstable --watch"

# vim
alias vv="v ~/.vimrc"
alias vz="v ~/.zshrc"
alias vt="v ~/.tmux.conf"
alias vm="v ~/.xmonad/xmonad.hs"
alias v="nvim"

# dotfiles
alias dots='yadm'
alias dotss="dots status"
alias dotsa="dots add"
alias dotsc="dots commit -m"
alias dotsC="dots checkout"
alias dotsR="dots reset --hard"
alias dotsp="dots push"
alias dotsb="dots branch"
alias dotsd="dots diff"

# git
alias gd="git diff"
alias gl="git log"
alias gR="git reset --hard"
alias gCC="git clean -fd"
alias gC="git checkout"
alias gP="git pull"
alias gp="git push"
alias gs="git status"
alias ga="git add ."
alias gA="git add"
alias gc="git commit -m"
alias gm="git merge"
alias gmc="git --no-pager diff --name-only --diff-filter=U"
# </Aliases>

# <Function>
f() {
  eval $@ | fzf
}

db_postgres() {
  docker container run -p 5432:5432 --name postgres -e POSTGRES_PASSWORD=password -d -e POSTGRES_DB=$1 postgres
}

3000() {
  [[ -n "$1" && ! "$1" =~ / ]] && http "$1" http://localhost:3000/$2 ${@:3} && return
  http http://localhost:3000$1 ${@:2}
}

kill_containers() {
  docker container rm -f $(docker container ls -qa)
}
b() {
  sudo systemctl restart bluetooth
}

docs() {
  apidoc -i $1 -o docs
}

ssh() {
  case "$1" in
    test)
      /usr/bin/ssh -i  ~/.ssh/mac hopper@pruebas.miveloz.com
      ;;
    prod)
      /usr/bin/ssh hopper@api.miveloz.com
      ;;
    lain)
      /usr/bin/ssh lain@lost-navi.xyz
      ;;
    *)
      /usr/bin/ssh $@
      ;;
  esac
}

pac() {
  sudo pacman "$@" || (echo "Trying with yay..." && yay "$@" || echo "Nope. Good luck.")
}
# </Function>

# help :(

# <Env>
export VISUAL=nvim
export EDITOR="$VISUAL"
export FZF_DEFAULT_COMMAND='ag -g ""'
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/bellsoft-java8-amd64
export PATH=$PATH:$HOME/.yarn/bin
export SPICETIFY_INSTALL="$HOME/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"
export NPM_PACKAGES=$HOME/.npm-packages
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin:$HOME/.intelliJ/bin
export PYTHONPATH=/usr/share/python3
export PATH="$PATH:$HOME/.symfony/bin"
export PATH=$PATH:/$HOME/.emacs.d/bin:/opt/flutter/bin
export SDKMAN_DIR="$HOME/.sdkman"
source ~/.rvm/scripts/rvm
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# </Env>

# <Load>
. /opt/asdf-vm/asdf.sh
eval "$(starship init zsh)"
# </Load>
