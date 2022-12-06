require 'plugins'

vim.o.termguicolors = true
vim.o.laststatus = 0
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.hidden = true
vim.o.cmdheight = 0
vim.o.backupcopy = "yes"

vim.cmd "colorscheme everforest"

-- FZF
vim.env.FZF_DEFAULT_COMMAND = "fdfind --type f"
vim.keymap.set("n", "<C-p>", "<CMD>FZF<CR>")

require 'mason'.setup {}
require 'Comment'.setup {}
require 'null-ls'.setup {
	sources = {
		require "null-ls".builtins.formatting.prettierd,
		-- require "null-ls".builtins.diagnostics.eslint_d
	}
}
require 'zen-mode'.setup {
	window = {
		backdrop = 0.95,
		width = 80
	}
}

require "symbols-outline".setup {}

-- require 'boxed'.setup {}
require 'nvim-web-devicons'.setup {}
require 'lsp'
require 'treesitter'
require 'completion'
