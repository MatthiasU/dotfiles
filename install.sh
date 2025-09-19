

CONFIG_PATH="$HOME/.config/nvim"
PLUGIN_PATH="$CONFIG_PATH/pack/nvim/start"

GITHUB="https://github.com"

echo "Install neo-vim plugins..."

echo "Installing nvim-lspconfig..."
git clone $GITHUB/neovim/nvim-lspconfig $PLUGIN_PATH/nvim-lspconfig

echo "Installing kanagawa colorscheme..."
git clone $GITHUB/rebelot/kanagawa.nvim $PLUGIN_PATH/kanagawa

echo "Install telescope..."
echo "Needs plenary dependency..."
git clone $GITHUB/nvim-lua/plenary.nvim $PLUGIN_PATH/plenary
git clone $GITHUB/nvim-telescope/telescope.nvim $PLUGIN_PATH/telescope

