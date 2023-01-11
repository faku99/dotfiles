" Move cursor
inoremap <A-k>	<Esc>ji
nnoremap k		j
vnoremap k		j
inoremap <A-j>	<Esc>hi
nnoremap j		h
vnoremap j		h
inoremap <A-i>	<Esc>ki
nnoremap i		k
vnoremap i		k
inoremap <A-l>	<Esc>li
nnoremap l		l
vnoremap l		l

" Move current line up
vnoremap <S-i>		:m-2<CR>gv==gv
nnoremap <S-i>		:m-2<CR>==
inoremap <A-S-i>	<Esc>:m-2<CR>==gi

" Move current line down
vnoremap <S-k>		:m+1<CR>gv==gv
nnoremap <S-k>		:m+1<CR>==
inoremap <A-S-k>	<Esc>:m+1<CR>==gi

" Show/hide whitespace characters
noremap  <F5>	:set list!<CR>
cnoremap <F5>	<C-c>:set list!<CR>
inoremap <F5>	<C-o>:set list!<CR>

" INSERT mode
"nnoremap <S-o>
