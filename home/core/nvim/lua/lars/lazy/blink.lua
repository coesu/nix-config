return {
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = "rafamadriz/friendly-snippets",

		version = "v0.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config

		opts = {
			keymap = {
				preset = "default",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-o>"] = { "select_and_accept" },

				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- experimental auto-brackets support
			completion = { accept = { auto_brackets = { enabled = true } } },

			-- experimental signature help support
			-- signature = { enabled = true }
		},
		-- allows extending the enabled_providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},
}
