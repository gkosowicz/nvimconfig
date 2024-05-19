-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Kymaps

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- unhighlight the search
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", { silent = true })

-- move visual blocks up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center screen on moving around
-- keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
-- keymap.set("n", "n", "nzzzv")
-- keymap.set("n", "N", "Nzzzv")

-- replace without updaing the buffer
keymap.set("x", "<leader>p", '"_dP')

vim.api.nvim_create_user_command("CopyRelativePath", "call setreg('+', expand('%'))", {})
vim.api.nvim_create_user_command(
	"CopyRelativePathWithLineNumber",
	"call setreg('+', expand('%') . ':' . line('.'))",
	{}
)

keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
