-- Kanagawa
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			compile = true,
-- 			transparent = true,
-- 			overrides = function(colors)
-- 				return {
-- 					["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
-- 					["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
-- 					["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
-- 					["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
-- 					["@markup.list.markdown"] = { link = "Function" }, -- + list
-- 					["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
-- 					["@markup.list.checked.markdown"] = { link = "WarningMsg" }, -- - [X] checked list item
-- 				}
-- 			end,
-- 		})
-- 		vim.cmd("colorscheme kanagawa")
-- 	end,
-- 	build = function()
-- 		vim.cmd("KanagawaCompile")
-- 	end,
-- 	theme = "dragon",
-- }

-- Ayu
-- return {
-- 	"Shatur/neovim-ayu",
-- 	name = "ayu",
-- 	priority = 1000, -- Load before other plugins
-- 	config = function()
-- 		require("ayu").setup({
-- 			mirage = false, -- Set to true for Ayu Mirage variant
-- 		})
-- 		vim.cmd("colorscheme ayu")
-- 	end,
-- }

-- Gruvbox
-- return {
-- 	"sainnhe/gruvbox-material",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Optionally configure and load the colorscheme
-- 		-- directly inside the plugin declaration.
-- 		vim.g.gruvbox_material_background = "hard" -- or 'medium'/'soft'
-- 		vim.g.gruvbox_material_foreground = "material"
-- 		vim.g.gruvbox_material_enable_italic = true
-- 		vim.opt.background = "dark"
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 	end,
-- }

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false,
			show_end_of_buffer = false,
			term_colors = false,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {
				mocha = {
					base = "#11111b",
					mantle = "#11111b",
					crust = "#11111b",
				},
			},
			custom_highlights = {},
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
