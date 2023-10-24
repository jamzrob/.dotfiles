# Put files in this folder to add your own custom functionality.
# See: https://github.com/ohmyzsh/ohmyzsh/wiki/Customization
# 
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

bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect '\r' .accept-line
bindkey -s "^f" "tmux-sessionizer\n"
bindkey -s "^h" "cheat\n"

alias todo="~/todoer/target/release/todo"
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
export NODE_OPTIONS=--openssl-legacy-provider
export OPENAI_API_KEY=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
export TWILIO_ACCOUNT_SID=ACfeaac728b267b9603613bd4ddbe9b49e
export TWILIO_AUTH_TOKEN=df9bd786491b694d5e295c7dfe4dcc8a export NVM_DIR=~/.nvm
export EDITOR="nvim"
export GPG_TTY=$(tty)
if command -v ngrok &>/dev/null; then
	eval "$(ngrok completion)"
fi

export PATH="$HOME/.pyenv/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


## Etsy
alias ew='cd ~/development/Etsyweb/'
alias ship='cd ~/development/Etsyweb/htdocs/assets/js/MissionControl/SubApps/ShippingAndOrders'
alias yk='php bin/shipping/labels/yakit/util/merchant.php'
alias storybook="cd ~/development/Etsyweb/storybook/; yarnpkg run storybook"
alias fixmyvm="sudo systemctl stop mysqld.service"
alias letsgocypress="sudo buildapack stop; cd ~/development/Etsyweb/node_modules/buildapack; env NODE_OPTIONS=--max-old-space_size=8192 ./bin/build-production --version-assets --output-dir=htdocs/assets/dist/js --no-compress --no-minify --locales=en-US --regions-disabled=atlas-legacy,atlas-legacy-react,atlas-modern-preact,legacy,legacy-shop,support,internal-tools --variant evergreen"

alias myprs="gh pr list -A jraubenheimer -s all -L 80"

function lazypush() {
    git add .
    git commit --amend --no-edit
    git push --force-with-lease
}

export DEBUG_PRINT_LIMIT=1000000;
export PATH=${HOME}/google-cloud-sdk/bin:$PATH
. "$HOME/.cargo/env"

alias tail_php='tail -f /var/log/httpd/php.log'

if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi
