vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex )

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<A-w>l", ":wincmd l<CR>")
vim.keymap.set("n", "<A-w>k", ":wincmd k<CR>")
vim.keymap.set("n", "<A-w>j", ":wincmd j<CR>")
vim.keymap.set("n", "<A-w>h", ":wincmd h<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader><leader>x", ":source ~/.dotfiles/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
