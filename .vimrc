syntax on
" Display tabs as 4 spaces wide
set tabstop=4
" Automatically indent
set autoindent
" No autobreaking to wrap
set wrapmargin=0
" Text should trail off the edge of the screen and stay on one line
set nowrap
" Make splits more comprhensible
set splitbelow splitright
" For showing whitespace
" set list
set path=.,,**
set backspace=2

" turn hybrid line numbers on
set number relativenumber
set nu rnu

filetype plugin on
filetype indent on
let g:tex_flavor='latex'
set sw=2
set iskeyword+=:
set nocp
set shellslash


"Rust
source ~/.vim/ftplugin/rust.vim
let g:rustc_path="~/.cargo/bin/rustc"
let g:rust_fold = 2
let g:rust_bang_comment_leader = 1


imap ,cC /*************************************************************<Enter><Enter><Esc>XXi*************************************************************/<Esc>kA<Space>

map ,sP :setlocal spell! spelllang=en_us<CR>
map <Tab> gt
map <S-Tab> gT

"" Miscellaneous rules
" Automatically deletes all trailing whitespace on save.
"	autocmd BufWritePre * %s/\s\+$//e

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
	autocmd FileType tex inoremap iT_ \item<Space>
	autocmd FileType tex inoremap itM_ \begin{itemize}<Enter>\end{itemize}<Esc>ko
	autocmd FileType tex inoremap qT_ \begin{quote}<Enter>\end{quote}<Esc>ko
	autocmd FileType tex inoremap clS_ \begin{columns}<Enter>\end{columns}<Esc>ko
	autocmd FileType tex inoremap cL_ \column{.5\textwidth}<Enter>
	autocmd FileType tex inoremap sP_ \textsuperscript{
	autocmd FileType tex inoremap sB_ \textsubscript{
	autocmd FileType tex inoremap gR_ \textgreek{
	autocmd FileType tex inoremap hR_ \cjRL{
	autocmd FileType tex inoremap lgR_ \selectlanguage{greek}<Enter>
	autocmd FileType tex inoremap lhE_ \selectlanguage{hebrew}<Enter>
	autocmd FileType tex inoremap leN_ \selectlanguage{english}<Enter>

"" Groff files
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	"autocmd BufWritePost *.ms,*.me,*.mom,*.man :!make
	autocmd FileType groff inoremap qS_ .QS<Enter>.QE<Esc>O
	autocmd FileType groff inoremap fS_ .FS<Enter>.FE<Esc>O
	autocmd FileType groff inoremap bU_ .IP<Enter>\(bu<Space>3
