alias todo="~/todoer/target/release/todo"
alias gostreaks="ssh -i ~/.ssh/Default ubuntu@44.202.59.102"
alias vim="nvim"
alias mux="tmuxinator"
alias search="ssh search"
alias mlcp="mux start mlcp cicero"
alias ml="mux start ml"
alias ls='ls --color=auto -a'
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export NODE_OPTIONS=--openssl-legacy-provider
export OPENAI_API_KEY=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
export TWILIO_ACCOUNT_SID=ACfeaac728b267b9603613bd4ddbe9b49e
export TWILIO_AUTH_TOKEN=df9bd786491b694d5e295c7dfe4dcc8a export NVM_DIR=~/.nvm
export EDITOR="nvim"



export PATH=/opt/homebrew/opt/python@3.11/libexec/bin/:~/.local/scripts/:$PATH

alias nvim_config="vim ~/.config/nvim/init.lua"
alias rtmux="tmux source-file ~/.tmux.conf"

export GPG_TTY=$(tty)

alias gith="git config -l | grep alias | sed 's/^alias\.//g'"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

function lazypush() {
    git add .
    git commit --amend --no-edit
    git push --force-with-lease
}
