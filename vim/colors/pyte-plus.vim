" Vim color file
"
" Name:         pyte-plus.vim
" Version:      1.0
" Maintainer:   Adrien Berthet (monsieurdoc) <berthet.a@gmail.com>
"
" Should work in recent 256 colors terminals
" 
" Original version by Droggl http://leetless.de

" Initialization {{{
if &t_Co != 256 && ! has("gui_running")
  echomsg ""
  echomsg "err: please use GUI or a 256-color terminal (so that t_Co=256 could be set)"
  echomsg ""
  finish
endif

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "pyte"
"}}}

" Colors {{{
hi Normal       guifg=#ffffff   guibg=#c0d0e0   ctermfg=15  ctermbg=250
hi Cursor       guifg=black     guibg=#b0b4b8   ctermfg=0   ctermbg=245
hi CursorColumn                 guibg=#eaeaea               ctermbg=251
hi CursorLine                   guibg=#f6f6f6               ctermbg=253
hi Error        guifg=red       guibg=white     ctermfg=1   ctermbg=7   gui=bold,underline  cterm=bold,underline
hi ErrorMsg     guifg=red       guibg=white     ctermfg=1   ctermbg=7   gui=bold,underline  cterm=bold,underline
hi Folded       guifg=#708090   guibg=#c0d0e0   ctermfg=    ctermbg=75
hi LineNr       guifg=#ffffff   guibg=#c0d0e0   ctermfg=15  ctermbg=75
hi MatchParen   guifg=white     guibg=#80a090   ctermfg=7   ctermbg=    gui=bold            cterm=bold

hi NonText      guifg=#c0c0c0   guibg=#e0e0e0   ctermfg=251 ctermbg=245
hi Pmenu        guifg=white     guibg=#808080   ctermfg=7   ctermfg=237



if version >= 700

  "Tabpages
  hi TabLine guifg=black guibg=#b0b8c0 gui=italic
  hi TabLineFill guifg=#9098a0
  hi TabLineSel guifg=black guibg=#f0f0f0 gui=italic,bold

  "P-Menu (auto-completion)
  "PmenuSel
  "PmenuSbar
  "PmenuThumb
endif
"
" Html-Titles
hi Title      guifg=#202020 gui=bold
hi Underlined  guifg=#202020 gui=underline


hi lCursor   guifg=black   guibg=white

hi StatusLine guifg=white guibg=#8090a0 gui=bold,italic
hi StatusLineNC guifg=#506070 guibg=#a0b0c0 gui=italic
hi VertSplit guifg=#a0b0c0 guibg=#a0b0c0 gui=NONE


" Kommentare
hi Comment   guifg=#a0b0c0               gui=italic

" Konstanten
hi Constant  guifg=#a07040
hi String    guifg=#4070a0 
hi Number    guifg=#40a070
hi Float     guifg=#70a040
"hi Statement guifg=#0070e0 gui=NONE
" Python: def and so on, html: tag-names
hi Statement  guifg=#007020 gui=bold


" HTML: arguments
hi Type       guifg=#e5a00d gui=italic
" Python: Standard exceptions, True&False
hi Structure  guifg=#007020 gui=italic
hi Function   guifg=#06287e gui=italic

hi Identifier guifg=#5b3674 gui=italic

hi Repeat      guifg=#7fbf58 gui=bold
hi Conditional guifg=#4c8f2f gui=bold

" Cheetah: #-Symbol, function-names
hi PreProc    guifg=#1060a0 gui=NONE
" Cheetah: def, for and so on, Python: Decorators
hi Define      guifg=#1060a0 gui=bold

hi Todo       guifg=#a0b0c0 guibg=NONE gui=italic,bold,underline

" Python: %(...)s - constructs, encoding
hi Special    guifg=#70a0d0 gui=italic

hi Operator   guifg=#408010

" color of <TAB>s etc...  
hi SpecialKey guifg=#d8a080 guibg=#e8e8e8 gui=italic  

" Diff
hi DiffChange guifg=NONE guibg=#e0e0e0 gui=italic,bold
hi DiffText guifg=NONE guibg=#f0c8c8 gui=italic,bold
hi DiffAdd guifg=NONE guibg=#c0e0d0 gui=italic,bold
hi DiffDelete guifg=NONE guibg=#f0e0b0 gui=italic,bold


