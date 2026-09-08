" EN: LAST CHANGE 20260807
"
" ============ DEFAULT SETTINGS =============================================================================
set encoding=utf-8
set nocompatible                    " This must be first, because it changes other options as a side effect.
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set history=50                      " keep 50 lines of command line history
set ruler                           " show the cursor position all the time
set showcmd                         " display incomplete commands
set incsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set laststatus=2
set t_Co=256
set termguicolors                   " added 20220922 to enable Hex color codes
set hlsearch                        " set nohlsearch
set background=dark
set number
set relativenumber
set ignorecase
set colorcolumn=110
set nowrap
set wildmenu
set wildmode=list:longest,full
set hidden
set path+=**
set textwidth=110                   " so gqq works on splitting long lines at 110-th position -- 20240826
set viminfo='100,f1                 "20260210: remember local an d global marks for 100 files
set nrformats+=alpha                " added 20240212: to increase sequences of alpha chars
set formatoptions-=t
set formatoptions+=l

" ADDED 20210308
" wildmenu and wildmode are used for command line completion.
" the command line is "expanded" vertically with a list of all the
" options available on your machine displayed in columns and an
" horizontal strip that you can navigate with <Tab> (forward) and
" <S-Tab> (backward).
set wildmenu
set wildmode=list:longest,full

syntax on
filetype plugin indent on           "20240913
let &t_ut=''                        " added 20231117: fix for disapearing bg color when scrolling!
runtime! ftplugin/man.vim           " added 20221129: load man page into new split -- command 'Man ls' ...

" ============= OTHER SETTINGS ==============================================================================

" added 20231110
source ~/.vim/my-vimrc-includes/align.vim

" --- MOUSE DISPLAY SETTING ---
if has('mouse')
	set mouse=a
endif


" --- TAB CHARACTER DISPLAY ---
" method 2:
" set listchars=tab:\|\ 

" method 3: (active)
" (insert unicode character fo tight filled triangle big: '<ctrl + v>u25b6\ ')
" u25b6: ▶
" u25b7: ▷
" u25b8: ▸
" u25b9: ▹
" u25bb: ▻
" u27a1: ➡
" u22c5: ⋅
" u237f: ⍿  
"
" u254e: ╎ 
"
" u2506: ┆  
"
" u250a: ┊  
"
" u258f: ▏
" u00bb: »
" set listchars=tab:▶\
" set listchars=tab:⍿⋅
" set listchars=tab:»⋅
" set listchars=tab:▏⋅
" set listchars=tab:┊⋅
set listchars=tab:┊⋅
" set listchars=tab:┊\ 
" set listchars+=space:⋅
set listchars+=trail:⋅
set list
nnoremap <space>. :set listchars+=space:⋅ <CR>
nnoremap <space>, :set listchars-=space:⋅ <CR>

" 20220513 NOT working!!
"	let lc1='+=space:⋅'
"	let lc2='-=space:⋅'
"	
"	function ToggleListCharsSpace()
"		if &listchars == g:lc1
"			let &listchars = g:cl2
"		else
"			let &listchars == g:lc1
"		endif
"	endfunction
"	
"	nnoremap <F9> :call ToggleListCharsSpace() <CR>

" === PYTHON SETTINGS ===
autocmd Filetype python setlocal noexpandtab

" --- PYTHON SYNTAX HIGHLIGHT ---
" let python_highlight_all = 1

" --- LIGHTLINE STATUSBAR SETUP ---
" added from: https://github.com/itchyny/lightline.vim
" git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline
" change 20220922 colorscheme 'wombat' to 'dracula'
" let g:lightline = {'colorscheme': 'dracula'}

" --- TOGGLE NUMBER/RELTIVENUMBER ---
" <ctrl+1> to toggle between just number and number+relativenumber
" from: https://superuser.com/questions/339593/vim-toggle-number-with-relativenumber
"Relative with start point or with line number or absolute number lines
function! NumberToggle()
	if(&number == 1)
		" set number!
		set relativenumber!
	elseif(&relativenumber==1)
		set relativenumber
		set number
	else
		set norelativenumber
		set number
	endif
endfunction

nnoremap ,n :call NumberToggle()<CR>


" --- VIM-LSP ---
" added 20240913
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" --- FZF ---
set rtp+=/usr/bin/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" --- ALE ---
let g:ale_enabled = 0
" colorscheme codedark
" colorscheme nord
" colorscheme dracula
" hi Normal ctermbg=234

" --- RAINBOW ---
" enable Rainbow globally 20210813
" let g:rainbow_active = 1

" --- CROSSHAIR LOCATION ---
hi ColorColumn ctermbg=232 guibg='#3F4354'
set cursorline
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=232 guifg=NONE guibg='#3F4354'
hi CursorLine cterm=NONE ctermbg=232 guifg=NONE guibg='#3F4354'
" staro:
" hi CursorColumn cterm=NONE ctermbg=red ctermfg=white
" hi CursorColumn cterm=NONE ctermbg=NONE ctermfg=red
" hi CursorLine cterm=NONE cterm=underline ctermbg=NONE
" hi CursorLine guibg=grey16 guifg=NONE
" hi CursorLine guibg=royalblue4 guifg=NONE
" hi CursorColumn guibg=royalblue4 guifg=NONE
" hi CursorLine guibg='#181a1b' guifg=NONE
" hi CursorLine ctermbg=NONE cterm=underline term=NONE guifg=NONE guibg=NONE
" hi CursorColumn cterm=NONE term=NONE guifg=NONE guibg=NONE
" hi CursorColumn cterm=NONE ctermfg=NONE ctermbg=232
" hi CursorLine cterm=NONE cterm=underline ctermbg=NONE
" hi CursorColumn guifg=NONE guibg='#5f5f87'

" --- CUSTOM COLOR SETTINGS FOR tab AND space CHARS ---
" 20240116
:hi Whitespacechar ctermfg=DarkGray
:hi Tabspacechar   ctermfg=DarkGray
:match Whitespacechar / \+$/
:match Tabspacechar /\t/

" hi Normal guibg='#222430'
" hi Normal guibg='#231e2e'
" hi Normal guibg='#201d26'
" hi Normal guibg='#18151f' " very dark
" hi Normal guibg='#191926'
hi Normal guibg='#222229'

" =========== PLUGGINS (vim=plug) ===========================================================================
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasiser/vim-code-dark'
" Plug 'dense-analysis/ale'
" Plug 'inkarkat/vim-ingo-library'
" Plug 'inkarkat/vim-ShowTrailingWhitespace'
Plug 'matze/vim-move' " *** 20221121 (d)
Plug 'ziglang/zig.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" 20240205
Plug 'fxn/vim-monochrome'

" 20240214
" 20240903
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" 20240903
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

"20240913
Plug 'rust-lang/rust.vim'

call plug#end()

" vim-move plugin
" added 20221121
let g:move_key_modifier = 'C'            " *** 20221121 (d)
let g:move_key_modifier_visualmode = 'S' " *** 20221121 (d)

" ================== COLORSCHEMES ==============================

" --- 20240115 catpucin_ theme for lightline ---
let g:lightline = {'colorscheme': 'catppuccin_mocha'}

" --- SWITCH COLORSCHEMES ---
" source ~/.vim/my-vimrc-include/switch-colorschemes.vim

" --- SONOKAI COLOR THEME ---
" source ~/.vim/my-vimrc-include/sonokai-theme-include.vim

" --- DRACULA COLOR THEME ---
" source ~/.vim/my-vimrc-include/dracula-theme-include.vim

" --- DRACULA COLOR THEME (NEW) ---
" ADDED 20210127
" from: https://draculatheme.com/vim
" Install (Vim):
" These are the default instructions using Vim 8's |packages| feature. See sections below, if you use other plugin managers.
"     Create theme folder (in case you don't have yet):
" mkdir -p ~/.vim/pack/themes/start
" If you use vim 8.0 (and not 8.2), you may need to use ~/.vim/pack/themes/opt instead.
"     Navigate to the folder above:
" cd ~/.vim/pack/themes/start
"     Clone the repository using the "dracula" name:
" git clone https://github.com/dracula/vim.git dracula
"     Create configuration file (in case you don't have yet):
" touch ~/.vimrc
"     Edit the ~/.vimrc file with the following content:
" packadd! dracula
" syntax enable
" colorscheme dracula
" ---
" literal:
""" packadd! dracula
""" syntax enable
""" colorscheme dracula

" added 20220922 to correct right background for Dracula CS
" hi Normal ctermbg='282a36'
" hi Normal guibg='#282a36'
" hi Normal guibg='#222430'

" --- FINAL COLORSCHEME SETTING ---
" --- (if everything else fails) ---
" local colorscheme settings:
" colorscheme  simple-dark
" colorscheme  wombat256mod
" colorscheme nord

" 20240205
" from Plug 'fxn/vim-monochrome'
" let g:monochrome_italic_comments = 1
" colorscheme monochrome

" 20240115 installed "https://github.com/catppuccin/vim"
" instructions in README.md file
colorscheme catppuccin_mocha

" ================= ABBREVIATIONS ===========================================================================
" ab sbng #! /usr/bin/env bash<cr><tab>
" ab sbng #! /usr/bin/env bash<cr># fname: <c-r>%<cr># [] v1<cr># ---<cr>
" updated 20250807: insert datestamp
ab sbng #! /usr/bin/env bash<cr># fname: <c-r>%<cr># <c-r>=strftime('%Y%m%d')<cr> v1<cr># ---<cr>
ab pt3 #! /usr/bin/env python3<cr># -*- coding: utf-8 -*-<cr><cr><esc>:so ~/.vimrc | :set syntax=python
ab sout System.out.println(
ab zst const std = @import("std");<cr><cr>pub fn main() !void {<cr>const out = std.io.getStdOut().writer();<cr>const in = std.io.getStdiIn().reader();<cr><cr>try out.print("I'm Alive!\n", .{});<cr><cr>}<cr><esc>:so ~/.vimrc | :set syntax=zig

" --- C ABBREVIATIONS ---
" update 20250321
ab cstv #include <stdio.h><CR>#include <string.h><CR><CR><CR>int main(void)<right> {<CR><CR><CR><CR><CR>return 0;<CR>}<ESC>4ki<TAB>printf("I'm Alive");<ESC>:so ~/.vimrc | :set syntax=c
ab cst #include <stdio.h><CR>#include <string.h><CR><CR><CR>int main(int argc, char **argv)<right> {<CR><CR><CR><CR><CR>return 0;<CR>}<ESC>4ki<TAB>printf("I'm Alive");<ESC>:so ~/.vimrc | :set syntax=c

" --- ABBREVIATIONS AND MAPPINGS FOR JAVA ---
"added 20220803
iab psvm <TAB>public static void main(String[<Right><Space>args<Right><Space>{<CR><CR><CR><Right><Space>// end main<ESC>kki<CR>
inoremap sout System.out.println("");<ESC>hhi
iab inm if __name__ == '__main__':<CR>

" ================= MAPPINGS ================================================================================
let mapleader = " "

" --- ENCLOSING BRACKETS/SQUARE/CURLY ---
inoremap ${{ ${}<ESC>hli
inoremap {{ {}<ESC>hli
inoremap (( ()<ESC>hli
inoremap [[ []<ESC>hli
inoremap [[[ [[]]<ESC>hli


" --- ADD/REMOVE QUOTES AROUND WORD ---
" Quote a word consisting of letters from iskeyword.
nnoremap <silent> ,dq :call Quote('"')<CR>
nnoremap <silent> ,sq :call Quote("'")<CR>
nnoremap <silent> ,uq :call UnQuote()<CR>
function! Quote(quote)
	normal mz
	exe 's/\(\k*\%#\k*\)/' . a:quote . '\1' . a:quote . '/'
	normal `zl
endfunction

function! UnQuote()
	normal mz
	exe 's/["' . "'" . ']\(\k*\%#\k*\)[' . "'" . '"]/\1/'
	normal `z
endfunction


" --- SEARCH AND REPLACE [12] AND [123] WITH CONFIRMATION ---
" added 20210226
" search for [12] or [123] troughout a file and ask to deete it --> maped to ,d <comma+d>
nnoremap ,d :%s/\[\d\+]//gc


" --- COMMENT/UNCOMMENT VISUALLY SELECTED BLOCK ---
" added 20210622
" updated (en) 20221117
vnoremap ,pt :s@\(^\s*\)\(.*\)@\1# \2@<CR>
vnoremap ,pu :s@\(^\s*\)# @\1@<CR>
vnoremap ,jv :s@\(^\s*\)\(.*\)@\1// \2@<CR>
vnoremap ,ju :s@\(^\s*\)// @\1@<CR>

"
" --- c-STYLE COMMENT OUT VISUAL BLOCK ---
" added 20211101
" updated (en) 20221117
vnoremap ,ct :s/^/ * /<CR>gv"xdO/*<CR><ESC>0C */<ESC>k"xp<CR>
vnoremap ,cu :s/^\s*\* //<CR>gv"xdddkdd"xP<CR>


" --- HTML COMMENT/UNCOMMENT ---
" html style comment / uncomment visual selection
vnoremap ,ht :s/\%V\(.*\)\%V/<!-- \1 -->/<CR>
vnoremap ,hu :s/\%V<!-- \(.*\) -->\%V/\1/<CR>

" --- REMOVE LEADING CHARS WITH SPACE IN VISUAL MODE ---
" ???
vnoremap ,<space> :s@^.\{1,2\} @@<CR>

" --- REPLACE MULTIPLE <tab>S WITH TRAILING <space> WITH <tab>S ONLY ---
"
vnoremap ,t :s/\(\t\+\) \+/\1/g<CR>


" --- ENCLOSE VISUAL SELECTION BETWEEN <CODE></CODE> TAGS ---
" added 20210629
vnoremap ,cd di<code><CR></code><CR><ESC>kP?<code><CR>:s@.*\(<code>\)@\1@<CR>/</code><CR>:s@.*\(</code>\)@\1@<CR>j


" --- INSERT <CODE></CODE> AND PUT CURSOR INSIDE TO START TYPING OR PASTE CONTENTS ---
" added 20210629
nnoremap ,c i<code><CR></code><CR><ESC>kki

" --- SHIFT TAB AND REMOVE SPACES ---
" added 20211105
vnoremap ,rr >gv:s/\(\t\+\) \+/\1/g<CR>

" --- CLONE CURRENT LINE OR SELLECTION ---
" added 20240326
" clone current line or selection and:
"        - normal mode: paste it under current line
"        - visual selection: paste it over current line, but select lower selection block
noremap <leader>c yyp
vnoremap <leader>c yPgv


" --- SYNTAX SETUP MAPPINGS ---
noremap ,stb :so ~/.vimrc <bar> :set syntax=bash<CR>
noremap ,stz :so ~/.vimrc <bar> :set syntax=zig<CR>
noremap ,stp :so ~/.vimrc <bar> :set syntax=python<CR>
noremap ,stc :so ~/.vimrc <bar> :set syntax=c<CR>
noremap ,stj :so ~/.vimrc <bar> :set syntax=java<CR>


" --- NETRW WINDOW SETUP ---
" 20210813: vim's file explorer (Netrw) in left column of size 30 (close with :bd)
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>


" --- RANGER ---
" ranger settings 20210813
nnoremap <leader>r :Ranger<CR>
let g:ranger_map_keys = 0


" --- SEMICOLON MAPPINGS ---
" mapping to replace spaces and semicolon or just spaces
" at the end of the line:
" effect: single ; at the end of text remains
nnoremap <leader>s :s/ *;*$/;/<esc>j
nnoremap <leader>x vllc/* <ESC>A */<ESC>


" --- BREAK LINE AT POSITION 110 CHARS ---
" 0110lbikba
nnoremap ,b 0110lbi<BS><CR><ESC>


" --- MOVE ENTIRE LINES AROUND ---
" from: https://vim.fandom.com/wiki/Moving_lines_up_or_down
" to enter Alt+j key: Ctrl+v Alt+j in insert mode!
" nnoremap j :m.+1<CR>==
" nnoremap k :m.-2<CR>==
" inoremap j <ESC>:m.+1<CR>==gi
" inoremap j <ESC>:m.-2<CR>==gi
" vnoremap j :m'>+1<CR>gv=gv
" vnoremap k :m'<-2<CR>gv=gv


" --- MULTIPLE LINES MOVE ---
" move entire lines UP and DOWN
" to enter instead of Alt key --> SPACE key
nnoremap <Space>j :m.+1<CR>==
nnoremap <Space>k :m.-2<CR>==
vnoremap <Space>j :m'>+1<CR>gv=gv
vnoremap <Space>k :m'<-2<CR>gv=gv


" --- CMD PROMT SYMBOL REPLACEMENT ---
nnoremap ,4 :s/^\s*/$> /<CR> :nohl <CR><CR>
vnoremap ,4 :s/^\s*/$> /<CR> :nohl <CR><CR>
nnoremap <Space>4 :s/^\$ /$> /<CR> :nohl <CR><CR>
vnoremap <Space>4 :s/^\$ /$> /<CR> :nohl <CR><CR>


" --- NEERDTREE ---
" nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>n :NERDTreeToggle<CR>


" --- FZF ---
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fe :FZF -e<CR>


" --- REPLACES TABS TO 4 SPACES ---
" added 20220926
" whole lines -> <shift+v>
" block       -> <ctrl+v>
vnoremap <C-t> :s/\%V\t/    /g<CR>


" --- REMOVES LAGGING WHEN EDITING *.h FILES ---
" added 20231006
nnoremap <leader>st :syntax off<CR>:syntax on<CR>


" --- INSERT <SPACE> BETWEEN // AND TEXT ---
" 20220929
" replace '//text ...' with '// text ...'
noremap <Space>s :%s/\/\/\(\w.*\)/\/\/ \1/<CR>


" --- MAP ctrl+x ctrl+f to ctrl+f ---
inoremap <C-f> <C-x><C-f>


" --- COPY HTTP LINK INTO THE [NUMBER] HOLDER FOR THE LINK AFTER LYXD_ED DOCUMENT ---
" 20250515
" 1 - go inside '[' ']'
" 2 - <c-o> to go to coresponding link at the bottom
" 3 - pres ,lc to do the magic ...
noremap ,lc fhvg_y<C-o>ci[<C-r>0<ESC>


" --- OPEN ALL BUFFERS INTO SEPARATE TABS ---
" 20251114
" map ,bt :bufdo tab split<CR><CR>
nnoremap ,bt :bufdo tab split<CR><CR>


" --- TABLE ROW DIVIDERS ---
" 20251127
noremap ,tr 0yyjp}P<ESC>j


" --- MOVE '{' AFTER 'FUNC() ' ---
" 20251205
noremap <space>f jddkA {<ESC>


" --- SET SYNTAX MAPPINGS ---
" 20251210
noremap <space>ss :set syntax=<CR>
noremap <space>ssc :set syntax=c<CR>
noremap <space>sst :set syntax=text<CR>
noremap <space>ssj :set syntax=java<CR>
noremap <space>ssp :set syntax=python<CR>
noremap <space>ssg :set syntax=go<CR>
noremap <space>ssh :set syntax=sh<CR>


" --- INDENT/FORMAT main{} BLOCK ---
" 20251223
" select whole 'main() { ... }' block, formate it with '=' and
" replace 5 spaces with tabs
nnoremap <space>0 0Vf{%=gv:s/\(\t\+\) \+/\1/g<CR>


" --- INITIAL CONFIG SOURCE AND SYNTAX SETUP ---
" 20260114
" nnoremap <space>v :so ~/.vimrc <BAR> set syntax=c<CR>
nnoremap <space>v :so ~/.vimrc <BAR> set syntax=c <BAR> :noh<CR>


" --- MOVE LINE UNDER THE CURSOR INSIDE [] ---
" 20260210
" move line under the cursor inside []
" move selected text into []
nnoremap ,sb 0vg_xi[<c-r>"]<esc>j<cr>
vnoremap ,sb xi[]<ESC>h""p<ESC>

"
" --- CHANGE BUFFER TO FILE FROM LIST ---
" 20260210
" from: vim-working-with-buffers-multif-5ppp-20260210.txt
" https://builtin.com/articles/working-with-buffers-in-vim
nnoremap <Leader>b :buffers<CR>:buffer<Space>

" --- SEARCH IN VIM'S FILE EDIT HISTROY AND OPEN IT FOR EDIT/VIEW ---
" 20260211
" must enter colon ':' and add a line number
nnoremap <leader>oo :oldfiles<CR>e #<


" --- REPLACE LEADING 4 SPACES TO TABS ---
" 20260219 replace leading 4 spaces to tabs
nnoremap <space>4t :%s/\(^\s*\)\@<=    /\t/g<CR><BAR>:noh<CR>
vnoremap <space>4t :s/\(^\s*\)\@<=    /\t/g<CR><BAR>:noh<CR>

" --- REPLACE LEADING 2 SPACES TO TABS ---
" 20260612 replace leading 2 spaces to tabs
nnoremap <space>2t :%s/\(^\s*\)\@<=  /\t/g<CR><BAR>:noh<CR>
vnoremap <space>2t :s/\(^\s*\)\@<=  /\t/g<CR><BAR>:noh<CR>

" --- REPLACE SINGLE QUOTE INSIDE WORDS WITH APOSTROPHE COMMAND ---
" 20260311
nnoremap <space>9 :%s/\([[:alpha:]]\)'\([[:alpha:]]\)/\1´\2/g<CR><BAR>:noh<CR>


" --- RETAB VISUAL SELLECTION ---
" 20260317
vnoremap ,rt :retab!<CR>


" --- MOVE SELECTED TEXT BETWEEN '', OR BETWEEN "" ---
" 20260317
vnoremap <space>sq xi''<ESC>h""p<ESC>
vnoremap <space>dq xi""<ESC>h""p<ESC>


" 20240310
" TO ACCEPT TERMINAL BACKGROUND IMAGE kitty.conf
hi Normal guibg=NONE ctermbg=NONE

" 20260519
" remove '[...]' in current line
nnoremap ,ds :s/\[.\+\]//g<CR>:noh<CR>
vnoremap ,ds :s/\[.\+\]//g<CR>:noh<CR>

" 20260807
" insert datestamp 'YYYYmmdd'
nnoremap ,dt "=strftime('%Y%m%d')<cr>P<cr>
inoremap ,dt <c-r>=strftime('%Y%m%d')<cr>
vnoremap ,dt <c-r>=strftime('%Y%m%d')<cr>

" 20260812
" write and close buffer
noremap ,wd :w <bar> :bd<cr>
" or:
" noremap ,wd :w \| :bd<cr>
"

" 20260820
" change from 'nonmodifiable' to 'modifiable'
noremap ,mf :set modifiable<CR>

" change from 'modifiable' to 'nonmodifiable'
noremap ,nf :set nomodifiable<CR>

" 20260831
" put sellection inside double or single quotes
vnoremap 1q c''<esc>hp
vnoremap 2q c""<esc>hp

