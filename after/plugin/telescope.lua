local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fw', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

require('telescope').load_extension('fzf')

require('telescope').setup {
  pickers = {
    live_grep = {
      additional_args = function(opts)
        return { "--hidden" }
      end
    }
  }
}

local live_grep_args_shortcuts = require('telescope-live-grep-args.shortcuts')
vim.keymap.set('n', '<leader>fs', live_grep_args_shortcuts.grep_word_under_cursor) 
