# symlink dotfiles to appropriate places

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
    ".ssh/config"
)

for dotfile in "${DOTFILES[@]}";do
	rm -rf "${HOME}/${dotfile}"
	ln -sf "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done
