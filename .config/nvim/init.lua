local g = vim.g
local o = vim.o
local opt = vim.opt

--o.nocompatible = true
o.filetype = off

require("giulio.bootstrap")
require("giulio.plugins")
require("giulio.whichkey")
require("giulio.ts")
--require("giulio.lsp") inside giulio.ts
--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
--" => General Settings
--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- vim.cmd('colorscheme base16-gruvbox-dark-soft')
vim.cmd('colorscheme base16-catppuccin-frappe') o.termguicolors = true o.number = true
o.numberwidth = true o.relativenumber = true o.expandtab = true o.smarttab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true
o.undofile = true

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true
opt.mouse = "a"

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "


-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})

-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

map("i", "ii", "<ESC>")                             -- remap ESC to ii 
map('n', '<leader>sws', ':%s/\\s\\+$/<CR>')         -- remove whitespace
map('n', '<leader>w', ':up<cr>')                    -- write only if something is changed
map('v', '<C-r>', '"hy:%s/<C-r>h//g<left><left>')   -- search and replace in visual mode

--remap navigate between splits
map("n","<C-h>","<C-w>h") 
map("n","<C-j>","<C-w>j") 
map("n","<C-k>","<C-w>k") 
map("n","<C-l>","<C-w>l") 

--remap resize splits
--map("n","˙",":vertical resize +3<CR>") 
--map("n","¬",":vertical resize -3<CR>") 
--map("n","∆",":resize +3<CR>") 
--map("n","˚",":resize -3<CR>") 
-- Keybindings for telescope
--map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
--map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
--map("n", "<leader>fb", "<CMD>Telescope file_browser<CR>")
--map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
--map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")

--map("n","<F4>",[[:lua package.loaded.init = nil<CR>:source ~/.config/nvim/init.lua<CR>]])

-------------------------------------------------
-- status line
-------------------------------------------------
g.lightline = {
  colorscheme = 'wombat',
  active = {
    left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } }
  },
  component_function = {
    gitbranch = 'FugitiveHead'
  }
}
o.laststatus = 2

-------------------------------------------------
-- tmux stuff with slime
-------------------------------------------------

vim.g.slime_target = 'tmux'
-- vim.g.slime_default_config = {"socket_name" = "default", "target_pane" = "{last}"}
vim.g.slime_default_config = {
  -- Lua doesn't have a string split function!
  socket_name = vim.api.nvim_eval('get(split($TMUX, ","), 0)'),
  target_pane = '{top-right}',
}



