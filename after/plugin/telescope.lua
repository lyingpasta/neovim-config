local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})

require('telescope').load_extension('fzf')

require('telescope').setup {
  pickers = {
    live_grep = {
      additional_args = function (opts)
        return {"--hidden"}
      end
    }
  }
}
