
-- text 

if vim.g.vscode then
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

else
  require("pukyn")
end
