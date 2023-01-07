-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Fuzzy finder / Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Colorscheme
	use ({ 
		"rose-pine/neovim", 
		as = "rose-pine",
		config = function() 
			vim.cmd('colorscheme rose-pine')
		end 
	})

	-- treesitter
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	-- harpoon
	use('theprimeagen/harpoon')
	
	-- undotree
	use('mbbill/undotree')

	-- fugitive
	use({'lewis6991/gitsigns.nvim'})
end)
