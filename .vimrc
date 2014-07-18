set nowrap
set tabstop=4
set shiftwidth=4
set number
set bg=dark
set t_Co=256
:set expandtab
:set tabstop=2 
:syntax enable
:colorscheme softblue


"let perl_fold=1
augroup filetypedetect
autocmd! BufNewFile,BufRead *.epl,*.phtml setf embperl
augroup END
autocmd BufNewFile,BufRead *.epl,*.phtml colorscheme softblue

" Use perl compiler for all *.pl and *.pm files.
autocmd BufNewFile,BufRead *.pl compiler perl
autocmd BufNewFile,BufRead *.pm compiler perl

" Use python compiler for all *.py and *.pyc files.
autocmd BufNewFile,BufRead *.py compiler python
autocmd BufNewFile,BufRead *.pyc compiler python

autocmd BufNewFile,BufRead *.py colorscheme pychimp
autocmd BufNewFile,BufRead *.pyc colorscheme pychimp

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
filetype plugin indent on

" Use R compiler for all .R .r  files
autocmd BufNewFile,BufRead *.r compiler Rscript

" Use R compiler for all .R .r  files
autocmd BufNewFile,BufRead *.R compiler Rscript

:map <F2> :set nonumber<CR>
:map <F3> :set number<CR>
:map <F4> :set nowrap<CR>
:map <F5> :set wrap<CR>
:map <F6> :%!column -t<CR>
:map <F8> :%s/^/canceljob /gc<CR>

" Highlight a column in csv text.
" " :Csv 1    " highlight first column
" " :Csv 12   " highlight twelfth column
" " :Csv 0    " switch off highlight
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1
    execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    match Keyword /^[^,]*/
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
