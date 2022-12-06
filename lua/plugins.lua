vim.cmd [[packadd packer.nvim]]

return require 'packer'.startup(function(use)
	use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }

	use 'neovim/nvim-lspconfig'

	use "wbthomason/packer.nvim"

	use { "dracula/vim", as = "dracula" }
	use "ellisonleao/gruvbox.nvim"
	use "sainnhe/everforest"

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use { 'tpope/vim-vinegar', disable = true }

	use { 'junegunn/fzf' }

	use { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/nvim-cmp' }

	use 'numToStr/Comment.nvim'

	use '~/Projects/weekend.nvim'

	use { 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' }

	use 'folke/zen-mode.nvim'

	use 'simrat39/symbols-outline.nvim'

	use { 'kyazdani42/nvim-tree.lua', disable = true }

	use { 'nvim-tree/nvim-web-devicons' }

	use { '~/Projects/boxed.nvim' }
end)
