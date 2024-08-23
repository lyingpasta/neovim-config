local gitsigns = require("gitsigns")

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 200,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    -- Actions
    map({ "n", "v" }, "<leader>Gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
    map({ "n", "v" }, "<leader>Gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
    map({ "n", "v" }, "<leader>Gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
    map("n", "<leader>GS", gs.stage_buffer, { desc = "Stage buffer" })
    map("n", "<leader>Gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
    map("n", "<leader>GR", gs.reset_buffer, { desc = "Reset buffer" })
    map("n", "<leader>Gp", gs.preview_hunk, { desc = "Preview hunk" })
    map("n", "<leader>Gb", function()
      gs.blame_line({ full = true })
    end, { desc = "Blame line" })
    map("n", "<leader>Gtb", gs.toggle_current_line_blame, { desc = "Toggle blame line" })
    map("n", "<leader>Gd", gs.diffthis, { desc = "Diff this" })
    map("n", "<leader>GD", function()
      gs.diffthis("~")
    end, { desc = "Diff this (cached)" })
    map("n", "<leader>Gtd", gs.toggle_deleted, { desc = "Toggle deleted" })

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
  end,
})
