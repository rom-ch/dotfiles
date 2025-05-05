-- return {
--     'shaunsingh/nord.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--     vim.g.nord_contrast = true
--     vim.g.nord_borders = false
--     vim.g.nord_disable_background = false
--     vim.g.nord_italic = false
--     vim.g.nord_uniform_diff_background = true
--     vim.g.nord_bold = false
--
--     -- Load the colorscheme
--     require('nord').set()
--   end
-- }

-- return {
--     'catppuccin/nvim',
--     lazy = false,
--     name = 'catppuccin',
--     priority = 1000,
--     config = function()
--         flavour = 'mocha',
--         vim.cmd.colorscheme 'catppuccin'
--     end
-- }

-- return {
--     'datsfilipe/vesper.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         vim.cmd.colorscheme 'vesper'
--     end
-- }

-- return {
-- 	"Shatur/neovim-ayu",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("ayu").setup({
-- 			mirage = false, -- true for 'mirage' variant, false for 'dark'
-- 			overrides = {}, -- you can customize highlights here
-- 		})
-- 		vim.cmd("colorscheme ayu")
-- 	end,
-- }

return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("github-theme").setup({
			-- ...
		})

		vim.cmd("colorscheme github_dark_default")
	end,
}
