local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and autoindentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- disable line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- force nvim to use the system clipboard
opt.clipboard = "unnamedplus"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- more space for command messages
opt.cmdheight = 1

-- considers the "-" as part of words when using the w motion
opt.iskeyword:append("-")

-- set scrolloff to 8 lines.
opt.scrolloff = 8
