require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "terraform", "hcl", "go", "lua", "vim", "json", "toml", "rust", "yaml", "javascript", "typescript", "html"  },
	ignore_install = { "phpdoc" },
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	indent = {
		enable = true,
	},
})


