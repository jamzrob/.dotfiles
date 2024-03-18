# RVM Lazy-Loading for OMZ/Zsh

This plugin allows RVM (Ruby Version Manager) lazy-loading in Oh My Zsh (and 
perhaps other `zsh` installations). In my testing, my shell startup time was
reduced from 0.45 sec to 0.20 sec (using `time zsh -i -c exit`).

## Installation
### Oh My Zsh!
***Important:** If you did not install RVM with the option `--ignore-dotfiles`
(or if you are unsure) you must first disable RVM loading. This is done by
removing any entries in `~/.zshrc` or `~/.zprofile` of the form (or similar to):
```bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
```
or
```bash
export PATH="$PATH:$HOME/.rvm/bin"
```
once you do this, you may proceed with the installation instructions. 

Clone `zsh-rvm-lazy` into your custom plugins directory.
```bash
git clone https://github.com/FrederickGeek8/zsh-rvm-lazy ~/.oh-my-zsh/custom/plugins/zsh-rvm-lazy
```
Then add `zsh-rvm-lazy` to your OMZ plugins list.
```
plugins+=(zsh-rvm-lazy)
```

## What is Lazy Loading?
Lazy loading is the concept of only loading things when they need to be used. In
the context of Zsh, RVM is automatically loaded and setup when you launch your 
shell. While some may find this desirable, there is the undesired effect of 
delayed being able to interact will your shell (the launch time). By enabling 
a lazy-loading package, your shell startup time will most likely be reduced,
sometimes significantly.

## Possible Issues
- I have not tested this, but its likely that RVM will no longer autodetect 
Ruby versions in directories.
