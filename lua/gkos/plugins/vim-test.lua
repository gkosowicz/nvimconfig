return {
	"vim-test/vim-test",
	config = function()
		vim.g["test#strategy"] = "vimux"
		vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"

		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>tn", ":TestNearest<CR>", { silent = true })
		keymap.set("n", "<leader>tf", ":TestFile<CR>", { silent = true })
		keymap.set("n", "<leader>tl", ":TestLast<CR>", { silent = true })
		keymap.set("n", "<leader>tv", ":TestVisit<CR>", { silent = true })
	end,
}
