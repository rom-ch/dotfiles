vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main", build = "TSUpdate" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },

	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	-- { src = "https://github.com/craftzdog/solarized-osaka.nvim" },
	-- { src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	{ src = "https://github.com/VidocqH/auto-indent.nvim" },
	{ src = "https://github.com/kylechui/nvim-surround" },
	{ src = "https://github.com/catgoose/nvim-colorizer.lua" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
})

require("plugins.treesitter")
require("plugins.lsp")
require("plugins.formatter")
require("plugins.completion")
require("plugins.fzflua")

require("plugins.colorscheme")
require("plugins.oil")
require("mini.statusline").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("auto-indent").setup()
require("nvim-ts-autotag").setup()
require("nvim-surround")
