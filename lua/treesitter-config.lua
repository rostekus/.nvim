-- TREESITTER
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"c", "python", "lua", "vim", "go", "javascript", "typescript", "rust"},
	highlight = {
		enable = true,
	}
}
