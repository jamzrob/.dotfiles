POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_MODE='nerdfont-complete'
# EXPORT
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

export PYENV_ROOT="$HOME/.pyenv"
export NPM_CONFIG_USERCONFIG="$HOME/npm/conf"
export CLOUDSDK_CONFIG="$HOME/google-cloud-sdk"
export DOCKER_CONFIG="$HOME/.docker"
export GNUPGHOME="$HOME/.gnupg"
export RBENV_ROOT="$HOME/.rbenv"

export XDG_STATE_HOME="$HOME/.local/state" 

## OH MY ZSH
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump-$HOST"
export ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH_CUSTOM=~/.dotfiles/.oh-my-zsh

#export NVM_LAZY_LOAD=false
export ZSH_PYENV_LAZY_VIRTUALENV=true

#zstyle ':omz:plugins:nvm' lazy yes # lazy load nvim
plugins+=(tmux) # tksv kill serve 
plugins+=(sudo) # hit escape twice
plugins+=(copyfile) # copyfile to clipboard
plugins+=(fzf) #auto completions
plugins+=(1password) # opswd copy password to clip board
# plugins+=(zsh-vi-mode) # cool
plugins+=(web-search) # google
plugins+=(gh git-auto-fetch) # gh completions
plugins+=(zsh-autosuggestions zsh-syntax-highlighting)
## lazy loaders
#plugins+=(nvm)
plugins+=(pyenv-lazy)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


source $ZSH/oh-my-zsh.sh

autoload -Uz compinit && compinit

bindkey -s "^f" "tmux-sessionizer\n"
bindkey '^[[Z' autosuggest-accept  
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey '^ ' autosuggest-accept # ctrl + space

# ctrl r : history search zsh complete
# ctrl space : multi insert zsh complete
#
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh



## ALIAS
alias todo="~/my-dev/todoer/target/release/todo"
alias past="~/my-dev/todoer/target/release/past_todo"
alias etsypword="op read op://Private/etsycorp.com/password"
alias gostreaks="ssh -i ~/.ssh/Default ubuntu@44.202.59.102"
alias vim="nvim"
export EDITOR='nvim'
export VISUAL='nvim'
alias mux="tmuxinator"
alias search="ssh search"
alias mlcp="mux start mlcp cicero"
alias ml="mux start ml"
alias ls='ls --color=auto -a'
alias nvim_config="vim ~/.config/nvim/init.lua"
alias rtmux="tmux source-file ~/.tmux.conf"
alias gith="git config -l | grep alias | sed 's/^alias\.//g'"
alias dd='cd ~/.dotfiles'
alias vid='vi ~/development/Etsyweb/phplib/EtsyConfig/development.php'
alias vip='vi ~/development/Etsyweb/phplib/EtsyConfig/production.php'
alias gitnewrepo="gh repo create my-project --private --source=. --remote=upstream"
alias autogpt="$HOME/.config/AutoGPT/autogpts/autogpt/autogpt.sh run"


export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"






export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export EDITOR="nvim"
export CLOUDSDK_PYTHON="python3.10"

export PATH="$XDG_DATA_HOME/.pyenv/:$PATH"
export PATH="$XDG_DATA_HOME/.bun/bin:$PATH"
export PATH="$XDG_DATA_HOME/bin:$PATH"
export PATH="$XDG_DATA_HOME/.jenv/bin:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/.dotfiles/bin/setup:$PATH"
export PATH="$HOME/.dotfiles/bin/dotmanagement:$PATH"
export PATH="$HOME/.dotfiles/bin/git:$PATH"
export PATH="$HOME/.dotfiles/bin/setup:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/local/bin:$PATH"
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

createrepo() {
    gh repo create "$1" --private --source=. --remote=upstream
}


# create gitignores
function gi() { curl -sLw \"\\\n\" https://www.toptal.com/developers/gitignore/api/\$@ ;}


## ETSY
alias ew='cd ~/development/Etsyweb/'
alias ship='cd ~/development/Etsyweb/htdocs/assets/js/MissionControl/SubApps/ShippingAndOrders'
alias yk='php bin/shipping/labels/yakit/util/merchant.php'
alias storybook="cd ~/development/Etsyweb/storybook/; yarnpkg run storybook"
alias fixmyvm="sudo systemctl stop mysqld.service"
alias letsgocypress="sudo buildapack stop; cd ~/development/Etsyweb/node_modules/buildapack; env NODE_OPTIONS=--max-old-space_size=8192 ./bin/build-production --version-assets --output-dir=htdocs/assets/dist/js --no-compress --no-minify --locales=en-US --regions-disabled=atlas-legacy,atlas-legacy-react,atlas-modern-preact,legacy,legacy-shop,support,internal-tools --variant evergreen"
alias myprs="gh pr list -A jraubenheimer -s all -L 80"
alias tail_php='tail -f /var/log/httpd/php.log'
export DEBUG_PRINT_LIMIT=1000000;
export PATH=${HOME}/google-cloud-sdk/bin:$PATH
export PATH=${HOME}/development/Flutter/bin:$PATH
alias etsypass="op read op://Private/etsycorp.com/password"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Go in .zprofile

#eval "$(/opt/homebrew/bin/brew shellenv)"
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# only if init if rbenv is installed
alias air='$(go env GOPATH)/bin/air'
alias git-set="git remote set-url origin" # <host>:<workplace>/<repo>.git personalgit:1password/1password-teams-open-source.gi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
