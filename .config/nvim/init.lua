local g = vim.g
local o = vim.o
local opt = vim.opt



--o.nocompatible = true
o.filetype = off

require("bootstrap")
require("plugins")
require("whichkey")
--require('ts')
--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
--" => General Settings
--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
o.termguicolors = true
o.number = true
o.numberwidth = true o.relativenumber = true o.expandtab = true o.smarttab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

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


-- Keybindings for telescope
map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fb", "<CMD>Telescope file_browser<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")


-------------------------------------------------
-- STATUS LINE
-------------------------------------------------

g.lightline = {
  colorscheme = 'materia',
  active = {
    left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } }
  },
  component_function = {
    gitbranch = 'FugitiveHead'
  }
}
o.laststatus = 2









