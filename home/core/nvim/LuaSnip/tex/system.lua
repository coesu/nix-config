local helpers = require("lars.luasnip-helper-funcs")
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Math context detection
local tex = {}
tex.in_mathzone = require("lars/detect-mathzone").in_mathzone
tex.in_text = function()
	return not tex.in_mathzone()
end

-- Return snippet tables
return {
	-- ANNOTATE (custom command for annotating equation derivations)
	s(
		{ trig = "ann", snippetType = "autosnippet" },
		fmta(
			[[
      \annotate{<>}{<>}
      ]],
			{
				i(1),
				d(2, get_visual),
			}
		)
	),
	-- CITATION
	s(
		{ trig = "CC", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[
       \cite{<>}
      ]],
			{
				d(1, get_visual),
			}
		)
	),
	-- REFERENCE
	s(
		{ trig = "RF", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[
       (Fig. \ref{<>})
      ]],
			{
				d(1, get_visual),
			}
		)
	),
	-- REFERENCE
	s(
		{ trig = "RE", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[
      (Eq. \ref{<>})
      ]],
			{
				d(1, get_visual),
			}
		)
	),
	-- REFERENCE
	s(
		{ trig = "RR", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[
      ~\ref{<>}
      ]],
			{
				d(1, get_visual),
			}
		)
	),
	-- DOCUMENTCLASS
	s(
		{ trig = "dcc", snippetType = "autosnippet" },
		fmta(
			[=[
        \documentclass[<>]{<>}
        ]=],
			{
				i(1, "a4paper"),
				i(2, "article"),
			}
		),
		{ condition = line_begin }
	),
	-- USE A LATEX PACKAGE
	s(
		{ trig = "pack", snippetType = "autosnippet" },
		fmta(
			[[
        \usepackage{<>}
        ]],
			{
				d(1, get_visual),
			}
		),
		{ condition = line_begin }
	),
	-- INPUT a LaTeX file
	s(
		{ trig = "inn", snippetType = "autosnippet" },
		fmta(
			[[
      \input{<><>}
      ]],
			{
				i(1, "~/dotfiles/config/latex/templates/"),
				i(2),
			}
		),
		{ condition = line_begin }
	),
	-- LABEL
	s(
		{ trig = "lbl", snippetType = "autosnippet" },
		fmta(
			[[
      \label{<>}
      ]],
			{
				d(1, get_visual),
			}
		)
	),
	-- HPHANTOM
	s(
		{ trig = "hpp", snippetType = "autosnippet" },
		fmta(
			[[
      \hphantom{<>}
      ]],
			{
				d(1, get_visual),
			}
		)
	),
	s(
		{ trig = "TODOO", snippetType = "autosnippet" },
		fmta([[\TODO{<>}]], {
			d(1, get_visual),
		})
	),
	s(
		{ trig = "nc" },
		fmta([[\newcommand{<>}{<>}]], {
			i(1),
			i(2),
		}),
		{ condition = line_begin }
	),
	s(
		{ trig = "sii", snippetType = "autosnippet" },
		fmta([[\si{<>}]], {
			i(1),
		})
	),
	s(
		{ trig = "SIG" },
		fmta([[\SI{<>}{GPa}]], {
			i(1),
		})
	),
	s(
		{ trig = "SIV" },
		fmta([[\SI{<>}{eV}]], {
			i(1),
		})
	),
	s(
		{ trig = "SI" },
		fmta([[\SI{<>}{<>}]], {
			i(1),
			i(2),
		})
	),
	s(
		{ trig = "url" },
		fmta([[\url{<>}]], {
			d(1, get_visual),
		})
	),
	-- VSPACE
	s(
		{ trig = "vs" },
		fmta([[\vspace{<>}]], {
			d(1, get_visual),
		})
	),
	-- SECTION
	s(
		{ trig = "h1", snippetType = "autosnippet" },
		fmta([[\section{<>}]], {
			d(1, get_visual),
		})
	),
	-- SUBSECTION
	s(
		{ trig = "h2", snippetType = "autosnippet" },
		fmta([[\subsection{<>}]], {
			d(1, get_visual),
		})
	),
	-- SUBSUBSECTION
	s(
		{ trig = "h3", snippetType = "autosnippet" },
		fmta([[\subsubsection{<>}]], {
			d(1, get_visual),
		})
	),
}
