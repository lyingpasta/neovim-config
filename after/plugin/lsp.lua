-- Required modules
local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local luasnip = require("luasnip")

function eslint_or_lsp_format()
  if vim.fn.exists(":EslintFixAll") ~= 0 then
    vim.cmd("EslintFixAll")
  elseif vim.fn.exists(":LspZeroFormat") ~= 0 then
    vim.cmd("LspZeroFormat")
  else
    vim.lsp.buf.format()
  end
end

-- LSP on_attach function
local function lsp_on_attach(client, bufnr)
  local keymap = vim.keymap
  local opts = { buffer = bufnr, remap = false }

  -- Key mappings for various LSP functions
  keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  keymap.set("n", "<leader>lws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>lf", eslint_or_lsp_format, opts)
  keymap.set("n", "<leader>ld", function()
    vim.diagnostic.open_float()
  end, opts)
  keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)
  keymap.set("n", "<leader>lca", function()
    vim.lsp.buf.code_action()
  end, opts)
  keymap.set("n", "<leader>lrr", function()
    vim.lsp.buf.references()
  end, opts)
  keymap.set("n", "<leader>lrn", function()
    vim.lsp.buf.rename()
  end, opts)
  keymap.set("n", "<leader>lh", function()
    vim.lsp.buf.signature_help()
  end, opts)
end

-- LSP setup
lsp.preset("recommended")
lsp.setup()

-- Auto-detect WGSL files
vim.filetype.add({
  extension = {
    wgsl = "wgsl",
  },
})

-- Mason setup
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "eslint",
    "html",
    "lua_ls",
    "rust_analyzer",
    "svelte",
    "tailwindcss",
    "tsserver",
    "wgsl_analyzer",
  },
  automatic_installation = true,
})

-- CMP (completion-nvim) configuration
local cmp = require("cmp")
local cmp_mapping = cmp.mapping

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Key mappings for CMP
    ["<C-b>"] = cmp_mapping.scroll_docs(-4),
    ["<C-f>"] = cmp_mapping.scroll_docs(4),
    ["<C-Space>"] = cmp_mapping.complete(),
    ["<C-e>"] = cmp_mapping.abort(),
    ["<CR>"] = cmp_mapping.confirm({ select = true }),
    ["<Tab>"] = cmp_mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp_mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
  -- Other CMP configurations
  -- ...
})

-- LSP server configurations
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  -- Additional WGSL-specific configurations (if any)
})

-- Rust Analyzer
lspconfig.rust_analyzer.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  -- Additional Rust-specific configurations
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})

-- WGSL Analyzer (Note: Adjust according to the actual LSP for WGSL)
lspconfig.wgsl_analyzer.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  -- Additional WGSL-specific configurations (if any)
})

-- GDScript
lspconfig.gdscript.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  -- Additional GDScript-specific configurations (if any)
})

-- Typescript
lspconfig.tsserver.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  -- Additional GDScript-specific configurations (if any)
})
lspconfig.eslint.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  -- Additional GDScript-specific configurations (if any)
})

-- Svelte
lspconfig.svelte.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  -- Additional GDScript-specific configurations (if any)
})

-- Tailwind
lspconfig.tailwindcss.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  -- Additional GDScript-specific configurations (if any)
})

-- Tailwind
lspconfig.html.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  -- Additional GDScript-specific configurations (if any)
})

-- Diagnostic configurations
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = true,
})
