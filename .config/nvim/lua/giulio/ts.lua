
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

--local ok, lspkind = pcall(require, "lspkind")
--if not ok then
--  return
--end

------------------------------------------------------------------------
--                             lsp config                             --
------------------------------------------------------------------------

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = function() 
    vim.keymap.set("n","K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n","gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n","gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n","<space>df", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n","<space>db", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n","<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n","<leader>dl", "<cmd>Telescope diagnostic<cr>", {buffer=0}) 
    end,
}

vim.opt.completeopt={"menu","menuone","noselect"}

-- julia lsp
local REVISE_LANGUAGESERVER = false
require'lspconfig'.julials.setup({
    on_new_config = function(new_config, _)
        local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
        if REVISE_LANGUAGESERVER then
            new_config.cmd[5] = (new_config.cmd[5]):gsub("using LanguageServer", "using Revise; using LanguageServer; if isdefined(LanguageServer, :USE_REVISE); LanguageServer.USE_REVISE[] = true; end")
        elseif require'lspconfig'.util.path.is_file(julia) then
            new_config.cmd[1] = julia
        end
    vim.keymap.set("n","K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n","gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n","gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n","<space>df", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n","<space>db", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n","<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n","<leader>dl", "<cmd>Telescope diagnostic<cr>", {buffer=0})
    end,
    -- This just adds dirname(fname) as a fallback (see nvim-lspconfig#1768).
    root_dir = function(fname)
        local util = require'lspconfig.util'
        return util.root_pattern 'Project.toml'(fname) or util.find_git_ancestor(fname) or
               util.path.dirname(fname)
    end,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- Disable automatic formatexpr since the LS.jl formatter isn't so nice.
        vim.bo[bufnr].formatexpr = ''
    end,
    capabilities = capabilities,
})
------------------------------------------------------------------------
--                             cmp config: completion                             --
------------------------------------------------------------------------

local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },

    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },

 -- formatting: to give sources from where the suggestion is coming from
--   formatting = {
--   format = lspkind.cmp_format {
--       with_text = true,
--       menu = {
--           buffer = "[buf]",
--           nvim_lsp = "[LSP]",
--           path = "[path]",
--           ultisnips = "[snip]",
--       },
-- },
--   },
--
    sources = cmp.config.sources({  -- here we are giving the sources for autocompletion - order is importance
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
	}, {
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  }, {
    { name = "gh_issues" },
  }),  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
--  --
 --LSP julia in init.lua
--local REVISE_LANGUAGESERVER = false
--require'lspconfig'.julials.setup({
--    on_new_config = function(new_config, _)
--        local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
--        if REVISE_LANGUAGESERVER then
--            new_config.cmd[5] = (new_config.cmd[5]):gsub("using LanguageServer", "using Revise; using LanguageServer; if isdefined(LanguageServer, :USE_REVISE); LanguageServer.USE_REVISE[] = true; end")
--        elseif require'lspconfig'.util.path.is_file(julia) then
--            new_config.cmd[1] = julia
--        end
--    end,
--    -- This just adds dirname(fname) as a fallback (see nvim-lspconfig#1768).
--    root_dir = function(fname)
--        local util = require'lspconfig.util'
--        return util.root_pattern 'Project.toml'(fname) or util.find_git_ancestor(fname) or
--               util.path.dirname(fname)
--    end,
--    on_attach = function(client, bufnr)
--        on_attach(client, bufnr)
--        -- Disable automatic formatexpr since the LS.jl formatter isn't so nice.
--        vim.bo[bufnr].formatexpr = ''
--    end,
--    capabilities = capabilities,
--})
------------------------------------------------------------------------
--                          Telescope config                          --
------------------------------------------------------------------------
local action_state = require('telescope.actions.state')
require("telescope").setup {
    defaults = {
        prompt_prefix = "$ ",
        mappings = {
            i = {
                ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
                }   
        }
    }
}

local mappings = {

}

mappings.curr_buf = function()
    --local opt = require('telescope.themes').get_ivy({height = 10, previewer =false,winblend = 10})
    local opt = require('telescope.themes').get_dropdown({winblend=10})
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
end,
{desc = '[/] Fuzzily search in current buffer]' }

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
return mappings



------------------------------------------------------------------------
--                            VIM  setups in lua style (cfr vim.init line 64)
------------------------------------------------------------------------

--vim.o.undofile = true
------------------------------------------------------------------------
--                            Old things
------------------------------------------------------------------------

--local sumneko_binary_path = vim.fn.exepath('lua-language-server')
--local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')
--
--local runtime_path = vim.split(package.path, ';')
--
--table.insert(runtime_path, "lua/?.lua")
--table.insert(runtime_path, "lua/?/init.lua")

--require'lspconfig'.sumneko_lua.setup {
--    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
--    settings = {
--        Lua = {
--        runtime = {
--            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--            version = 'LuaJIT',
--            -- Setup your lua path
--            path = runtime_path,
--        },
--        diagnostics = {
--            -- Get the language server to recognize the `vim` gloal
--            globals = {'vim'},
--        },
--        workspace = {
--            -- Make the server aware of Neovim runtime files
--            library = vim.api.nvim_get_runtime_file("", true),
--        },
--        -- Do not send telemetry data containing a randomized but unique identifier
--        telemetry = {
--            enable = false,
--        },
--        },
--    },
--}
---- Setup nvim-cmp.

