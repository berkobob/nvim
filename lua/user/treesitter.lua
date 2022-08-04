local configs = require 'nvim-treesitter.configs'
configs.setup {
	ensure_installed = { "lua", "dart" } ,  -- Only use parsers that are maintained
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	}
}
