set autoindent
set cc=120
set clipboard+=unnamedplus
set cursorline
set guicursor=i:block
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set mouse=a
set noexpandtab
set number
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set tabstop=4

filetype plugin on
syntax on

let config_dir = "$HOME/.config/nvim"

execute "source" config_dir . "/keybindings.vim"

call plug#begin()
Plug 'mhartington/oceanic-next'
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

syntax enable
colorscheme OceanicNext
