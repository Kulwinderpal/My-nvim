return {
{
                        "hrsh7th/nvim-cmp",
                        dependencies = {
                                {
                                        'L3MON4D3/LuaSnip',
                                        build = "make install_jsregexp",
                                        version = "v2.*",
                                        dependencies = {
                                'saadparwaiz1/cmp_luasnip',
                                        'rafamadriz/friendly-snippets',
                                }

                                },


                        	'neovim/nvim-lspconfig',
                                'hrsh7th/cmp-nvim-lsp',
                                'hrsh7th/cmp-buffer',
                                'hrsh7th/cmp-path',
                                'hrsh7th/cmp-cmdline',
                },
		config = function ()
		
			  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
   },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })
require("luasnip.loaders.from_vscode").load()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })


			
		end
 }
}
