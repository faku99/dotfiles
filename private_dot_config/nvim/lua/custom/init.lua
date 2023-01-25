vim.o.autoindent = false
vim.o.cc = 120
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.guicursor = "i:block"
vim.o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"
vim.o.mouse = "a"
vim.o.noexpandtab = true
vim.o.number = true
vim.o.shiftwidth = 4
vim.o.smartindent = false
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.syntax = true
vim.o.tabstop = 4
vim.o.termguicolors = true

-- vim.g.oceanic_next_terminal_bold = 1
-- vim.cmd('colorscheme OceanicNext');

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  command = [[%s/\s\+$//e]],
});

-- Disable perf provider
vim.g.loaded_perl_provider = 0
