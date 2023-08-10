local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"gopls",

})

lsp.set_preferences({
	sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = false,
		virtual_text = true,
		underline = false,
	}
)


local golang_setup = {
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach(signature_setup, bufnr)  -- Note: add in lsp client on-attach
  end,
}

require'lspconfig'.gopls.setup(golang_setup)
