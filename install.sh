# install.sh
# symlink you dotfiles to appropriate places

DIR=$HOME/.dotfiles

DOTFILES=(
    ".bin"
    ".zshrc"
    ".bashrc"
    ".zshrc"
    ".zprofile"
    ".tmux.conf"
    ".gitconfig"
    ".config/nvim"
    ".config/tmuxinator"
)

for dotfile in "${DOTFILES[@]}";do
	rm -rf "${HOME}/${dotfile}"
	ln -sf "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done
