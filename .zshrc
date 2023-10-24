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





export PATH="$HOME/.pyenv/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

###
#function lazypush() {
#    git add .
#    git commit --amend --no-edit
#    git push --force-with-lease
#}
#
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
