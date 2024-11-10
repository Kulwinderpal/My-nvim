-- Improve Startup Times
vim.loader.enable()

-- Add Line Numbers
vim.cmd "set number"

-- Set Powershell as the default Shell
vim.o.shell = "pwsh.exe"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Add Your Plugins Here
require("lazy").setup({
	spec = {
		{ "navarasu/onedark.nvim" },
		{ "xiyaowong/transparent.nvim" },
		{ "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons" },
		{	"nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = "nvim-lua/plenary.nvim"},
		{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons"},
		{
			"williamboman/mason.nvim",
			dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" }
		},
		{ "nvimtools/none-ls.nvim", dependencies = "nvim-lua/plenary.nvim" },
		{
			"hrsh7th/nvim-cmp", 
			dependencies = { 
				{ 'L3MON4D3/LuaSnip', build = "make install_jsregexp", version = "v2.*", dependencies = {
				'saadparwaiz1/cmp_luasnip',
					'rafamadriz/friendly-snippets',
				} },


			'neovim/nvim-lspconfig',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline'
		},
	},
		{ "goolord/alpha-nvim", dependencies = "nvim-tree/nvim-web-devicons" },
},
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "onedark" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Configure Plugins Here

-- Configure and Enable onedark
require("onedark").load({
	style = "cool",
	transparent = true,
	lualine = {
		transparent = true,
	},
})

-- Enable Transparency
vim.cmd("TransparentEnable")
require("transparent").clear_prefix("NvimTree")
require('transparent').clear_prefix('BufferLine')


-- Enable and Configure Lualine
require("lualine").setup({
	icons_enabled = true,
	icons_enabled = true,
	theme = "onedark",
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename", "filetype" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
})

-- Configure and Setup Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "vim", "rust", "powershell", "c", "vimdoc" },
	indent = { enable = true },
	highlight = { enable = true },
	auto_install = true,
})

-- Configure and Setup Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Telescope live grep" })

-- Use and Configure nvim-tree
require("nvim-tree").setup()
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Use Bufferline
require("bufferline").setup({})

-- Use and Configure Mason
require("mason").setup({
	ensure_installed = {
		formatter = { "stylua" },
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "powershell_es", "rust_analyzer" },
})
require("lspconfig").lua_ls.setup({
	capabilities = capabilities
})
require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities
})
require("lspconfig").powershell_es.setup({
	capabilities = capabilities
})

-- Use and Configure none-ls
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Use and Configure nvim-cmp
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
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })
require("luasnip.loaders.from_vscode").load()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Use and Configure alpha
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    alpha.setup(dashboard.opts)
