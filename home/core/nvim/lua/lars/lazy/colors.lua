return {
	"RRethy/base16-nvim",
	config = function()
		vim.cmd("colorscheme base16-gruvbox-dark-hard")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	end,
}
-- return {
-- 	"luisiacc/gruvbox-baby",
-- 	config = function()
-- 		vim.cmd("colorscheme gruvbox-baby")
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- 		-- vim.g.gruvbox_material_background = 'hard'
-- 	end,
-- }
