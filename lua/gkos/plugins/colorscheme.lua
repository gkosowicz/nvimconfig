return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		-- load the colorscheme here
		vim.cmd.colorscheme("rose-pine")
	end,
}
