vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)


vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true
vim.o.autoindent = true
vim.o.termguicolors = true

vim.o.wrap = false

vim.o.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.cursorline = true

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
