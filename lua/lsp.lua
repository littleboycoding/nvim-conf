local client_filter = function(client)
	local l = { "tsserver" }

	for _, v in ipairs(l) do
		if client.name == v then return false end
	end

	return true
end

local on_attach = function(_, bufnr)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
	vim.keymap.set("n", "<Space>f",
		function() vim.lsp.buf.format { async = true, filter = client_filter } end, { buffer = bufnr }
	)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
	vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, { buffer = bufnr })

	vim.keymap.set("n", "<Space>rn", vim.lsp.buf.rename, { buffer = bufnr })
	vim.keymap.set("n", "<Space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
	vim.keymap.set("n", "<Space>ca", vim.lsp.buf.code_action, { buffer = bufnr })

	vim.keymap.set("n", "<PageUp>", vim.diagnostic.goto_prev, { buffer = bufnr })
	vim.keymap.set("n", "<PageDown>", vim.diagnostic.goto_next, { buffer = bufnr })
	vim.keymap.set("n", "<Space>e", vim.diagnostic.open_float, { buffer = bufnr })
end

require 'mason-lspconfig'.setup {}
require 'mason-lspconfig'.setup_handlers {
	function(server_name) require 'lspconfig'[server_name].setup { on_attach = on_attach } end,
	sumneko_lua = function()
		require 'lspconfig'.sumneko_lua.setup {
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = {
						version = "luaJIT",
					},
					diagnostics = {
						globals = { 'vim' },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
				}
			}
		}
	end,
}
