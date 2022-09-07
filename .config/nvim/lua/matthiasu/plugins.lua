vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'folke/tokyonight.nvim'
	use 'sainnhe/everforest'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	use 'L3MON4D3/LuaSnip'

	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'

	use 'nvim-lualine/lualine.nvim'

	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'

	use {
		'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
	}

	use 'preservim/nerdtree'

end)
