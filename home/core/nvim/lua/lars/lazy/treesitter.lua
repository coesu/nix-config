return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"vimdoc",
				"c",
				"cpp",
				"lua",
				"rust",
				"bash",
				"python",
				"nix",
				"markdown",
				"markdown_inline",
			},
			sync_install = false,
			modules = {},
			ignore_install = {},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		})

		-- local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		-- treesitter_parser_config.templ = {
		-- 	install_info = {
		-- 		url = "https://github.com/vrischmann/tree-sitter-templ.git",
		-- 		files = { "src/parser.c", "src/scanner.c" },
		-- 		branch = "master",
		-- 	},
		-- }
		--
		-- vim.treesitter.language.register("templ", "templ")
	end,
}
