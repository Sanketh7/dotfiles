local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
    set_lsp_keymaps = false
})

lsp.ensure_installed({
	'sumneko_lua',
    'gopls',
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	if client.name == "eslint" then
		vim.cmd.LspStop('eslint')
		return
	end

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>vh", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
end)

lsp.nvim_workspace()

lsp.setup()
