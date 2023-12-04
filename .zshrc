## OH MY ZSH
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_CUSTOM=~/.dotfiles/.oh-my-zsh
ZSH_TMUX_AUTOSTART=true

NVM_LAZY_LOAD=true
ZSH_PYENV_LAZY_VIRTUALENV=true
plugins+=(tmux) # tksv kill serve 
plugins+=(sudo) # hit escape twice
plugins+=(copyfile) 
plugins+=(web-search) # google
plugins+=(git github git-auto-fetch) #empty_gh, new_gh, exist_gh
plugins+=(zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)
plugins+=(pyenv-lazy nvm-lazy nvm-lazy zsh-rvm-lazy)

source $ZSH/oh-my-zsh.sh

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
alias rskhd="skhd --restart-service"

# EXPORT
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state" 
export XDG_RUNTIME_DIR="/run/user/$UID" 


export NVM_DIR="$XDG_CONFIG_HOME/.nvm"
export CLOUDSDK_CONFIG="$XDG_CONFIG_HOME/google-cloud-sdk"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/.docker"
export PYENV_VERSION="3.8.16"
export PYENV_ROOT="$XDG_CONFIG_HOME/.pyenv"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export EDITOR="nvim"
export CLOUDSDK_PYTHON="python3.10"

export PATH="$HOME/.config/.pyenv/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"
export PATH="/opt/homebrew/opt/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$HOME/.config/.jenv/bin:$PATH"

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
