
" Enable line numbering
set number

" Enable syntax highlighting
syntax enable

" Enable looooong history
set history=1000

" Enable dark-mode coloring
set background=dark

" Shut up the ding-ing
set noerrorbells

" Match existing file identation style
set autoindent

" Enable search highlighting
set hlsearch

" Disable case-sensitivity
set ignorecase

" Line wrapping options
set wrap
set linebreak

" Temporary vim file storage
set dir=~/.vim/swap			    " Swap
set backupdir=~/.vim/cache	    " Cache
set viminfo+=n~/.vim/viminfo    " Viminfo

" TMUX-friendly set/unset paste
" Source: https://github.com/ryanpcmcquen/fix-vim-pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

" ----- Status Bar -----
" Set basics of statusline
set laststatus=2
set t_Co=256
hi statusline ctermbg=lightcyan ctermfg=black guibg=lightcyan guifg=black

" Set basic colors
hi ModeCy       ctermbg=25 ctermfg=159
hi ModeToReg    ctermbg=32 ctermfg=25
hi DarkCy       ctermbg=25 ctermfg=159
hi DarkToReg    ctermbg=32 ctermfg=25
hi RegCy        ctermbg=32 ctermfg=17
hi RegToLight   ctermbg=38 ctermfg=32
hi LightCy      ctermbg=38 ctermfg=17

" Set mode colors
hi InsertCy       ctermbg=25 ctermfg=9
hi ReplaceCy      ctermbg=25 ctermfg=11
hi SelectCy       ctermbg=25 ctermfg=159
hi InteractCy     ctermbg=25 ctermfg=159

" Set readonly colors
hi RegToRo        ctermbg=9 ctermfg=32
hi ReadOnly       ctermbg=9 ctermfg=15
hi RoToLight      ctermbg=38 ctermfg=9

" Clear defaults
set statusline=
" Left side
set statusline+=%#ModeCy#\ %{StatuslineMode()}%#ModeToReg#
set statusline+=%#RegCy#\ %F\ %y
" Check for readonly mode
let readwrite=filewritable(@%)
if readwrite
    set statusline+=\ %#RegToLight#
else
    set statusline+=\ %#RegToRo#%#ReadOnly#\ 🔒\ %#RoToLight#
endif
" Mid flex section
set statusline+=%#LightCy#%=
" Right side
set statusline+=%#RegToLight#%#RegCy#\ Col\:\ %c\ Lne\:\ %l\ /\ %L\[%p%%\]
set statusline+=\ %#DarkToReg#
set statusline+=%#DarkCy#\ Enc\:\ %{strlen(&fenc)?&fenc:'none'}\[%{&ff}\]\ 


function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#"n"
        " Normal blue
        hi ModeCy       ctermbg=25 ctermfg=159
        hi ModeToReg    ctermbg=32 ctermfg=25
        return "NORMAL\ "
    elseif l:mode==?"v"
        " Special purple
        hi ModeCy       ctermbg=62 ctermfg=147
        hi ModeToReg    ctermbg=32 ctermfg=62
        return "VISUAL\ "
    elseif l:mode==#"i"
        " Insert red
        hi ModeCy       ctermbg=124 ctermfg=218
        hi ModeToReg    ctermbg=32 ctermfg=124
        return "INSERT\ "
    elseif l:mode==#"R"
        " Replace yellow
        hi ModeCy       ctermbg=166 ctermfg=228
        hi ModeToReg    ctermbg=32 ctermfg=166
        return "REPLACE\ "
    elseif l:mode==?"s"
        " Select green
        hi ModeCy       ctermbg=64 ctermfg=192
        hi ModeToReg    ctermbg=32 ctermfg=64
        return "SELECT\ "
    elseif l:mode==#"t"
        " Special purple
        hi ModeCy       ctermbg=62 ctermfg=147
        hi ModeToReg    ctermbg=32 ctermfg=62
        return "TERMINAL\ "
    elseif l:mode==#"c"
        " Special purple
        hi ModeCy       ctermbg=62 ctermfg=147
        hi ModeToReg    ctermbg=32 ctermfg=62
        return "COMMAND\ "
    elseif l:mode==#"!"
        " Special purple
        hi ModeCy       ctermbg=62 ctermfg=147
        hi ModeToReg    ctermbg=32 ctermfg=62
        return "SHELL\ "
    endif
endfunction
