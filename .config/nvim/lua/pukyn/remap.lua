vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move text around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep kurzor to the left
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yaynke to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- scrap text
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- select and edit all same words as the one below cursor 
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("i", "<S-right>", "<Esc>ve")
vim.keymap.set("i", "<S-left>", "<Esc>vb")
vim.keymap.set("i", "<S-up>", "<Esc>v<Up>")
vim.keymap.set("i", "<S-down>", "<Esc>v<down>")

-- aply macro over visual range
vim.keymap.set('x', '@', '":norm @" . getcharstr() . "<cr>"', { expr = true })
