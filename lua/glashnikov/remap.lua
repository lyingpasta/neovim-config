vim.g.mapleader = " "

-- explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Neotree)

-- actions
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>lf", vim.cmd.LspZeroFormat)

vim.keymap.set('n', '<C-l>', vim.cmd.bnext)
vim.keymap.set('n', '<C-h>', vim.cmd.bprevious)
vim.keymap.set("n", "<leader>c", vim.cmd.bdelete)

-- macros
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
