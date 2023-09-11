local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())



local REVISE_LANGUAGESERVER = false
require'lspconfig'.julials.setup({
    on_new_config = function(new_config, _)
        local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
        if REVISE_LANGUAGESERVER then
            new_config.cmd[5] = (new_config.cmd[5]):gsub("using LanguageServer", "using Revise; using LanguageServer; if isdefined(LanguageServer, :USE_REVISE); LanguageServer.USE_REVISE[] = true; end")
        elseif require'lspconfig'.util.path.is_file(julia) then
            new_config.cmd[1] = julia
        end
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
    vim.keymap.set("n","<leader>rrr", vim.lsp.buf.rename, {buffer=0})
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
  --
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
