return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",

	lazy = true,
	event = "BufEnter",

	dependencies = { "rafamadriz/friendly-snippets" },

	config = function()
		-- --------------------------------------------- "
		local ls = require("luasnip")
		local s = ls.snippet
		local sn = ls.snippet_node
		local isn = ls.indent_snippet_node
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local c = ls.choice_node
		local d = ls.dynamic_node
		local r = ls.restore_node
		local events = require("luasnip.util.events")
		local ai = require("luasnip.nodes.absolute_indexer")
		local fmt = require("luasnip.extras.fmt").fmt
		local m = require("luasnip.extras").m
		local lambda = require("luasnip.extras").l
		local postfix = require("luasnip.extras.postfix").postfix
		-----------------------------------------------

		ls.config.set_config({
			history = false,
			enable_autosnippets = true,
			region_check_events = "InsertEnter",
			delete_check_events = "InsertLeave",
		})
		-- require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
	end,
}
