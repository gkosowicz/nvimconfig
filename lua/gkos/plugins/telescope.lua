function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ""
	end
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				initial_mode = "normal",
				path_display = { "smart" },
				mappings = {
					n = {
						["<C-d>"] = actions.delete_buffer,
					}, -- n
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set(
			"n",
			"<leader>fs",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Find string in cwd" }
		)
		-- keymap.set("v", "<leader>fs", function()
		-- 	local text = vim.getVisualSelection()
		-- 	require("telescope").extensions.live_grep_args.live_grep_args({ default_text = '"' .. text .. '"' })
		-- end, { noremap = true, silent = true, desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		-- keymap.set("v", "<leader>fc", function()
		-- 	local text = vim.getVisualSelection()
		-- 	require("telescope.builtin").live_grep({ default_text = text })
		-- end, { noremap = true, silent = true, desc = "Find selected string in cwd" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find file in open buffers" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume telescope window" })
		keymap.set(
			"n",
			"<leader>fm",
			"<cmd>Telescope lsp_document_symbols<cr>",
			{ desc = "Find document symbols in open file" }
		)
	end,
}
