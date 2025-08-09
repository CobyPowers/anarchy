vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.g.mapleader = " "

vim.keymap.set({'n', 'v', 'i'}, "<F5>", "<CMD>term ./build.sh<CR>")
