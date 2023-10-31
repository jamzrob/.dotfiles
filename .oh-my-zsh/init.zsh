# Put files in this folder to add your own custom functionality.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization
# Files in the custom/ directory will be:
# - loaded automatically by the init script, in alphabetical order
# - loaded last, after all built-ins in the lib/ directory, to override them
# - ignored by git by default
# 
# Example: add custom/shortcuts.zsh for shortcuts to your local projects
# 
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
#
alias todo="~/my-dev/todoer/target/release/todo"
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





export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export EDITOR="nvim"
export GPG_TTY=$(tty)
if command -v ngrok &>/dev/null; then
	eval "$(ngrok completion)"
fi

export PATH="$HOME/.pyenv/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"
export PATH="/opt/homebrew/opt/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then 
    eval "$(pyenv init -)"
fi

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


export NVM_DIR="$HOME/.nvm"
if command -v nvm 1>/dev/null 2>&1; then 
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi




alias rskhd="skhd --restart-service"

## Move cursor up and down
# Get ceiling eg: 7/2 = 4
ceiling_divide() {
  ceiling_result=$((($1+$2-1)/$2))
}

clear_rows() {
  POS=$1
  # Insert Empty Rows to push & preserve the content of screen
  for i in {1..$((LINES-POS-1))}; echo
  # Move to POS, after clearing content from POS to end of screen
  tput cup $((POS-1)) 0
}

# Clear quarter
alias ptop='ceiling_divide $LINES 4; clear_rows $ceiling_result'
# Clear half
alias pmid='ceiling_divide $LINES 2; clear_rows $ceiling_result'
# Clear 3/4th
alias pdown='ceiling_divide $((3*LINES)) 4; clear_rows $ceiling_result'

alias ez="vim ~/.dotfiles/.oh-my-zsh/init.zsh"
alias rz="~/.zshrc"




## Etsy
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
## 
