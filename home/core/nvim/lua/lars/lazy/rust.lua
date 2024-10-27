return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	dependencies = { "rust-lang/rust.vim" },
	["rust-analyzer"] = {
		cargo = {
			allFeatures = true,
		},
	},
}
