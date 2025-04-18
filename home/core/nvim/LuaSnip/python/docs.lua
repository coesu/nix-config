local helpers = require("lars.luasnip-helper-funcs")
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	-- FUNCTION PARAMETERS for use in docstrings, with heading
	s(
		{ trig = "PP", snippetType = "autosnippet" },
		fmta(
			[[
      Parameters
      ----------
      <> : <>
          <>
      ]],
			{
				i(1, "name"),
				i(2, "data_type"),
				d(3, get_visual),
			}
		),
		{ condition = line_begin }
	),
	-- FUNCTION RETURNS for use in docstrings, with heading
	s(
		{ trig = "RR", snippetType = "autosnippet" },
		fmta(
			[[
      Returns
      ----------
      <> : <>
          <>
      ]],
			{
				i(1, "name"),
				i(2, "data_type"),
				d(3, get_visual),
			}
		),
		{ condition = line_begin }
	),
	-- FUNCTION PARAMETER for use in docstrings
	s(
		{ trig = "::", snippetType = "autosnippet" },
		fmta(
			[[
      <> : <>
          <>
      ]],
			{
				i(1, "name"),
				i(2, "data_type"),
				d(3, get_visual),
			}
		),
		{ condition = line_begin }
	),
	-- LONG STRING OF DASHES FOR COMMENTS
	s(
		{ trig = "--", snippetType = "autosnippet" },
		{ t("# -------------------------------------------------------------------- #") },
		{ condition = line_begin }
	),
	-- MULTILINE COMMENT
	s(
		{ trig = "cc", snippetType = "autosnippet" },
		fmta(
			[[
      """
      <>
      """
      ]],
			{
				d(1, get_visual),
			}
		),
		{ condition = line_begin }
	),
}
