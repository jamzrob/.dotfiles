POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_MODE='nerdfont-complete'
# EXPORT
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state" 

## OH MY ZSH
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump-$HOST"

export ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH_CUSTOM=~/.dotfiles/.oh-my-zsh

export NVM_LAZY_LOAD=true
export ZSH_PYENV_LAZY_VIRTUALENV=true
plugins+=(tmux) # tksv kill serve 
plugins+=(sudo) # hit escape twice
plugins+=(copyfile) 
plugins+=(web-search) # google
plugins+=(git github git-auto-fetch) #empty_gh, new_gh, exist_gh
plugins+=(zsh-autosuggestions zsh-syntax-highlighting)
plugins+=(zsh-nvm-lazy-load)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


source $ZSH/oh-my-zsh.sh

autoload -Uz compinit && compinit

bindkey -s "^f" "tmux-sessionizer\n"
bindkey -s "^h" "cheat\n"
bindkey '^[[Z' autosuggest-accept  
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey '^ ' autosuggest-accept # ctrl + space

# ctrl r : history search zsh complete
# ctrl space : multi insert zsh complete
#
[[ ! -f ~/.dotfiles/.config/.p10k.zsh ]] || source ~/.dotfiles/.config/.p10k.zsh



## ALIAS
alias todo="~/my-dev/todoer/target/release/todo"
alias past="~/my-dev/todoer/target/release/past_todo"
alias etsypword="op read op://Private/etsycorp.com/password"
alias gostreaks="ssh -i ~/.ssh/Default ubuntu@44.202.59.102"
alias vim="nvim"
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


export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/conf"
export NVM_DIR="$XDG_CONFIG_HOME/.nvm"
export CLOUDSDK_CONFIG="$XDG_CONFIG_HOME/google-cloud-sdk"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/.docker"
export PYENV_VERSION="3.8.16"
export PYENV_ROOT="$XDG_CONFIG_HOME/.pyenv"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/.gem"
export GEM_HOME="$XDG_DATA_HOME/.gem"
export GNUPGHOME="$XDG_DATA_HOME/.gnupg"
export RBENV_ROOT="$XDG_DATA_HOME/.rbenv"






export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export EDITOR="nvim"
export CLOUDSDK_PYTHON="python3.10"

export PATH="$XDG_DATA_HOME/.pyenv/:$PATH"
export PATH="$XDG_DATA_HOME/.bun/bin:$PATH"
export PATH="$XDG_DATA_HOME/.bin:$PATH"
export PATH="$XDG_DATA_HOME/.jenv/bin:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/.dotfiles/.bin/:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
#export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"
#export PATH="/opt/homebrew/opt/bin:$PATH"
#export PATH="/usr/local/opt/openssl/bin:$PATH"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}


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

#eval "$(/opt/homebrew/bin/brew shellenv)"
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
