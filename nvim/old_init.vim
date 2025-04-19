" Basic settings
set number              " Show line numbers
set relativenumber      " Relative numbers for jumping around
set tabstop=4 shiftwidth=4 expandtab  " Soft tabs
set nowrap              " Don't wrap lines
set hidden              " Switch buffers without saving
set mouse=a             " Enable mouse

" Easier access to configs
nnoremap <leader>vi :e ~/.vimrc<CR>
nnoremap <leader>vc :e ~/.config/i3/config<CR>
nnoremap <leader>vk :e ~/.config/kitty/kitty.conf<CR>

" Save with Ctrl + S
nnoremap <C-s> :w<CR>

