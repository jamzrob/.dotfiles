c README

```bash
./bin/setup/mac-setup

```
## Setup git

## Clone this repo
```bash
git clone --recurse-submodules git@github.com:jamzrob/.dotfiles.git
```
 ## Install Curl (only linux)
```bash 
Use `./install-curl-for-centos` script to install curl first
```

## Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Remove old files and link files
See `./bin/link-dotfiles`

## [Install homebrew](https://docs.brew.sh/)
Mac Version
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/$USERNAME/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
```
[Linux Version](https://docs.brew.sh/Homebrew-on-Linux)

- [Install requirements](Ihttps://docs.brew.sh/Homebrew-on-Linux#requirements)
- Install linux brew
```bash 
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zprofile
```

## Install homebrew packages
```bash
brew-install-all
```
 
## [Install cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```


## Use [bob](https://github.com/MordechaiHadad/bob) to install neovim
```bash
cargo install --git https://github.com/MordechaiHadad/bob.git
bob install stable
bob use stable
```

## Setup nvm & pyenv
```bash
./bin/setup/nvm-setup
./bin/setup/pyenv-setup
```

### Apps to install
```bash
brew-install-apps

```

iTerm2
1Password
1Password Safari Extension
Magnet
Todoist
Docker
Spotify
Docker
