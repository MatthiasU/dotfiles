
CONFIG_DIR="$HOME/.config"
NVIM_DIR="$CONFIG_DIR/nvim"
TMUX_DIR="$CONFIG_DIR/tmux"

if [ -d "$NVIM_DIR" ]; then
    rm -rf ~/.config/nvim
fi

PACKER_REPO="https://github.com/wbthomason/packer.nvim"
PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start"

# install packer pacakge manager
if [ ! -d "$PACKER_DIR" ]; then
    git clone --depth 1 $PACKER_REPO $PACKER_DIR/packer.nvim
fi

if [ -d "$TMUX_DIR" ]; then
    rm -rf ~/.config/tmux
fi

cp -r .config/nvim $CONFIG_DIR
cp -r .config/tmux $CONFIG_DIR

#cp .zprofile $HOME/.zprofile
cp .vimrc $HOME/.vimrc

# Install neovim

if [[ "$OSTYPE" =~ ^linux ]]; then
  sudo apt update && sudo apt install curl

  NEO_VIM_IMAGE="https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"

  cd $HOME
  curl -LO $NEO_VIM_IMAGE
  chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract
  sudo mv squashfs-root /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
  if [ -d "$HOME/nvim.appimage" ]; then
    rm -rf $HOME/nvim.appimage
  fi
fi

if [[ "$OSTYPE" =~ ^darwin ]]; then
    sudo brew install neovim
fi

