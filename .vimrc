set nowrap
set tabstop=4
set shiftwidth=4
set number
set ruler
set bg=dark
set t_Co=256
:set expandtab
:set tabstop=4
:syntax enable
:colorscheme softblue
set backspace=indent,eol,start
set hlsearch

augroup Perl
   autocmd!
   " Use perl compiler for all *.pl and *.pm files.
   autocmd BufNewFile,BufRead *.pl compiler perl
   autocmd BufNewFile,BufRead *.py colorscheme pychimp
   autocmd BufNewFile,BufRead *.pyc colorscheme pychimp
   autocmd BufNewFile,BufRead *.R,*.Rmd,*.r colorscheme softblue

   autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
   autocmd BufRead *.py set nocindent
   autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
   filetype plugin indent on
augroup END


:map <F2> :set nonumber<CR>
:map <F3> :set number<CR>
:map <F4> :set nowrap<CR>
:map <F5> :set wrap<CR>
:map <F6> :%!column -t<CR>
:map <F7> :s/torque/batch/g<CR>
:map <F8> :s/batch/torque/g<CR>
:map <F9> :%s/\s\+/\t/g<CR>

