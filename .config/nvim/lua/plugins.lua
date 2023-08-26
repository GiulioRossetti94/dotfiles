
-------------------------------------------------
-- PLUGINS
-------------------------------------------------

local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Dashboard is a nice start screen for nvim
	use("glepnir/dashboard-nvim")

	-- Telescope
--	use({
--		"nvim-telescope/telescope.nvim",
--		tag = "0.1.0",
--		requires = { { "nvim-lua/plenary.nvim" } },
--	})
	use("nvim-telescope/telescope-file-browser.nvim")

	use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/telescope.nvim")
	-- Productivity
   	use("SirVer/ultisnips")
    use("honza/vim-snippets")
    use("lervag/vimtex")

	use("folke/which-key.nvim") -- Which Key
    use("itchyny/lightline.vim") -- status line

	-- File management --
	use("scrooloose/nerdtree")
	use("tiagofumo/vim-nerdtree-syntax-highlight")
	use("ryanoasis/vim-devicons")

	-- Tim Pope Plugins --
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
 	use("tpope/vim-rhubarb")

	use("neovim/nvim-lspconfig")        -- enable lsp  
	use("hrsh7th/cmp-nvim-lsp")  
	use("hrsh7th/cmp-buffer")           -- buffer completions
	use("hrsh7th/cmp-path")             -- path completions
	use("hrsh7th/nvim-cmp")             -- 
	use("quangnguyen30192/cmp-nvim-ultisnips")
	


	-- Syntax Highlighting and Colors --
	use("vim-python/python-syntax")

	-- Colorschemes --
	use("RRethy/nvim-base16")
	use("kyazdani42/nvim-palenight.lua")

	-- Other stuff --

	if packer_bootstrap then
		packer.sync()
	end
end)

