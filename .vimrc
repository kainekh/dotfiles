syntax on
set tabstop=4
set autoindent
set wrapmargin=0
set nowrap
set splitbelow splitright

" turn hybrid line numbers on
set number relativenumber
set nu rnu

filetype plugin on
filetype indent on
let g:tex_flavor='latex'
set sw=2
set iskeyword+=:
set nocp

source ~/.vim/ftplugin/rust.vim


" Wrap functions
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
                set wrapmargin=1
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End> <C-o>g<End>
                noremap <silent> k gk
                noremap <silent> j gj
                noremap <silent> 0 g0
                noremap <silent> $ g$
                set wrapmargin=0
  endif
endfunction

map <F9> :setlocal spell! spelllang=en_us<CR>

"" Miscellaneous rules
" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

"" File type rules

"" Bib files
""".bib
	autocmd BufRead,BufNewFile *.bib set filetype=tex
	autocmd BufRead,BufNewFile *.tex set filetype=tex
	"autocmd BufWritePost *.tex make
	autocmd FileType bib inoremap aR_ @article{<Enter>author<Space>=<Space>{},<Enter>date<Space>=<Space>{},<Enter>title<Space>=<Space>{},<Enter>journal<Space>=<Space>{},<Enter>volume<Space>=<Space>{},<Enter>pages<Space>=<Space>{},<enter>location<Space>=<Space>{},<Enter>}<Enter><Esc>8kA<Esc>i
	autocmd FileType bib inoremap bK_ @book{<Enter>author<Space>=<Space>{},<Enter>date<Space>=<Space>{},<Enter>title<Space>=<Space>{},<Enter>publisher<Space>=<Space>{},<enter>location<Space>=<Space>{},<Enter>}<Enter><Esc>6kA<Esc>i
	autocmd FileType bib inoremap cL_ @incollection{<Enter>author<Space>=<Space>{},<Enter>title<Space>=<Space>{},<Enter>booktitle<Space>=<Space>{},<Enter>editor<Space>=<Space>{},<Enter>date<Space>=<Space>{},<Enter>publisher<Space>=<Space>{},<enter>location<Space>=<Space>{},<Enter>}<Enter><Esc>8kA<Esc>i

	autocmd FileType tex inoremap fN_ \footnote{<Enter>}<Esc>ko
	autocmd FileType tex inoremap fR_ \begin{frame}<Enter>\end{frame}<Esc>ko
	autocmd FileType tex inoremap fT_ \frametitle{}<Esc>i
	autocmd FileType tex inoremap itM_ \begin{itemize}<Enter>\end{itemize}<Esc>ko\item<Space>
	autocmd FileType tex inoremap iT_ \item<Space>
	autocmd FileType tex inoremap qT_ \begin{quote}<Enter>\end{quote}<Esc>ko
	autocmd FileType tex inoremap clS_ \begin{columns}<Enter>\end{columns}<Esc>ko
	autocmd FileType tex inoremap cL_ \column{.5\textwidth}<Enter>
	autocmd FileType tex inoremap sP_ \textsuperscript{
	autocmd FileType tex inoremap sB_ \textsubscript{
	autocmd FileType tex inoremap gR_ \textgreek{
	autocmd FileType tex inoremap hR_ \cjRL{
	autocmd FileType tex inoremap lgR_ \selectlanguage{greek}<Enter>
	autocmd FileType tex inoremap lhR_ \selectlanguage{hebrew}<Enter>
	autocmd FileType tex inoremap leN_ \selectlanguage{english}<Enter>

"" Groff files
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufWritePost *.ms,*.me,*.mom,*.man make
	autocmd FileType groff inoremap qS_ .QS<Enter>.QE<Esc>O
	autocmd FileType groff inoremap fS_ .FS<Enter>.FE<Esc>O
	autocmd FileType groff inoremap bU_ .IP<Enter>\(bu<Space>3
