vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with << and >>
vim.opt.tabstop = 4 -- How many spaces are shown per Tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing Tab

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Keep identation from previous line

-- Enable break indent
vim.opt.breakindent = true

-- Always show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Show line under cursor
vim.opt.cursorline = true

-- Store undos between sessions
vim.opt.undofile = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "auto"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- Decrease update time (default: 4000)
vim.opt.updatetime = 250

-- More space in the Neovim command line for displaying messages (default: 1)
vim.opt.cmdheight = 1

-- Allow backspace on (default: 'indent,eol,start')
vim.opt.backspace = "indent,eol,start"

-- Set termguicolors to enable highlight groups (default: false)
vim.opt.termguicolors = true

-- Always show tabs (default: 1)
vim.opt.showtabline = 2

-- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
-- vim.o.whichwrap = "bs<>[]hl"

-- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
vim.o.writebackup = false

-- Set completeopt to have a better completion experience (default: 'menu,preview')
-- vim.o.completeopt = "menuone,noselect"
