set mouse=a
set tabstop=4
set shiftwidth=4
set nocompatible
set makeprg=g++\ -std=c++17\ -DLOCAL\ %\ -o\ %<\ &&\ ./%<
syntax on
set autoindent
set smartindent
set showmatch
set backspace=indent,eol,start
set relativenumber
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'          " UltiSnips snippet manager
Plug 'honza/vim-snippets'        " Optional: pre-defined snippets library
Plug 'dense-analysis/ale'
call plug#end()

" UltiSnips key bindings
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"


" Enable ALE (Asynchronous Lint Engine) for real-time error checking
let g:ale_enabled = 1

" Enable ALE for C++ language
let g:ale_linters = {
\   'cpp': ['gcc', 'clang']
\}

" Set the gcc or clang executable for ALE
let g:ale_cpp_gcc_executable = 'g++'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra -Werror -DLOCAL'

" You can also specify clang options if you prefer clang++
" let g:ale_cpp_clang_executable = 'clang++'
" let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra -Werror -DLOCAL'

" Automatically fix linting errors when possible (optional)
let g:ale_fix_on_save = 1

" Highlight errors in real-time
let g:ale_sign_column_always = 1


" Customize error and warning symbols (optional)
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>'

" Show errors in a floating window (optional)
let g:ale_hover_cursor = 1

"Auto runs c++ or c files as soon as :w is recieved
"autocmd BufWritePost *.c,*.cpp make

" Use control+b to call :w and :make
nnoremap <C-b> :w<CR>:make<CR>

" Use control+d to call yy and p
inoremap <C-d> <Esc>YpA

