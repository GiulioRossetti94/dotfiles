


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
    vim.keymap.set("n","<space>r", vim.lsp.buf.rename, {buffer=0})
    end,
}

vim.opt.completeopt={"menu","menuone","noselect"}
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
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

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
end
return mappings
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

