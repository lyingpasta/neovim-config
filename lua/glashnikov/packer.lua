-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Fuzzy finder / Telescope
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  })

  -- Colorscheme
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  })
  use({
    "olivercederborg/poimandres.nvim",
    config = function()
      require("poimandres").setup({})
    end,
  })

  -- treesitter
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("nvim-tree/nvim-web-devicons")
  use("windwp/nvim-ts-autotag")

  -- harpoon
  use("theprimeagen/harpoon")

  -- undotree
  use("mbbill/undotree")

  -- fugitive
  use({ "lewis6991/gitsigns.nvim" })
  use({ "tpope/vim-fugitive" })

  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/nvim-cmp" },

      -- Snippets
      { "L3MON4D3/LuaSnip",                 run = "make install_jsregexp" },
      { "saadparwaiz1/cmp_luasnip" },

      -- Snippet Collection (Optional)
      { "rafamadriz/friendly-snippets" },
    },
  })

  -- control line
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- which key
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  -- buffer line
  use({
    "akinsho/bufferline.nvim",
    -- tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons"
  })

  -- neotree
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        "s1n7ax/nvim-window-picker",
        -- tag = "v1.*",
        config = function()
          require("window-picker").setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal", "quickfix" },
              },
            },
            other_win_hl_color = "#e35e4f",
          })
        end,
      },
    },
    config = function()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "󱧡", texthl = "DiagnosticSignHint" })
      -- NOTE: this is changed from v1.x, which used the old style of highlight groups
      -- in the form "LspDiagnosticsSignWarning"

      vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end,
  })

  -- comment
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  -- navigation status bar
  use({
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  })

  -- brackets
  use("m4xshen/autoclose.nvim")

  -- indent line guide
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end,
  })

  -- autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- wilder
  use({ "gelguy/wilder.nvim" })

  -- glow
  use({
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup()
    end,
  })

  -- illuminate
  use({ "RRethy/vim-illuminate" })

  -- lsp status
  use({ "j-hui/fidget.nvim" })

  -- Python
  use({ "pappasam/coc-jedi" })

  -- NeoScroll
  use("karb94/neoscroll.nvim")

  -- RandWord
  use { "kungfusheep/randomword.nvim" }

  -- Avante.nvim with build process
  -- Required plugins
  use 'stevearc/dressing.nvim'
  use 'MeanderingProgrammer/render-markdown.nvim'

  -- Optional dependencies
  use 'HakonHarnes/img-clip.nvim'
  use 'zbirenbaum/copilot.lua'

  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = 'make',
    config = function()
      require('avante').setup()
    end
  }
end)
