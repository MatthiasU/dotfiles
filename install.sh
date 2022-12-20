
CONFIG_DIR="$HOME/.config"
NVIM_DIR="$CONFIG_DIR/nvim"
TMUX_DIR="$CONFIG_DIR/tmux"

if [ -d "$NVIM_DIR" ]; then
    rm -rf ~/.config/nvim
fi

if [ -d "$TMUX_DIR" ]; then
    rm -rf ~/.config/tmux
fi

cp -r .config/nvim $CONFIG_DIR
cp -r .config/tmux $CONFIG_DIR

cp .zprofile $HOME/.zprofile
cp .vimrc $HOME/.vimrc

