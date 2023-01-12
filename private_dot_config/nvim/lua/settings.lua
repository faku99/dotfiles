local opt = vim.o

opt.autoindent = true
opt.cc = 120
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.guicursor = "i:block"
opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"
opt.mouse = "a"
opt.noexpandtab = true
opt.number = true
opt.shiftwidth = 4
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 4
opt.tabstop = 4

vim.cmd("colorscheme OceanicNext")
