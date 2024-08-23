vim.g.mapleader = " "

-- explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Neotree, { desc = "Toggle file explorer" })

-- actions
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Save file" })
vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = "Close file" })
vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostics" })

vim.keymap.set("n", "<C-l>", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("n", "<C-h>", vim.cmd.bprevious, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>c", vim.cmd.bdelete, { desc = "Close buffer" })

-- macros
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

vim.keymap.set("n", "U", vim.cmd.redo, { desc = "Redo" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })
vim.keymap.set("n", "<leader>se", [[/<C-r><C-w><CR>]], { desc = "Search word under cursor" })
vim.keymap.set("n", "<leader>sw", [[/\<<C-r><C-w>\><CR>]], { desc = "Search word under cursor" })

