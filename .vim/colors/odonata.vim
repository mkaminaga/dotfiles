" Vim color file
" Author: Mamoru Kaminaga

let g:colors_name=expand('<sfile>:t:r')
set background=dark
highlight clear

if exists("syntax_on")
      syntax reset
endif

"
" 256-color terminal
"
hi Normal           ctermfg=252     ctermbg=233
hi CursorLine       ctermbg=196                     cterm=none
hi CursorLineNr     ctermfg=196                     cterm=none
hi Boolean          ctermfg=135
hi Character        ctermfg=288
hi Number           ctermfg=141                     cterm=none
hi Ignore           ctermfg=244     ctermbg=232
hi IncSearch        ctermfg=193     ctermbg=16

hi keyword          ctermfg=161                     cterm=bold
hi Label            ctermfg=229                     cterm=none
hi Macro            ctermfg=82
hi SpecialKey       ctermfg=81

hi MatchParen       ctermfg=233     ctermbg=208     cterm=bold
hi ModeMsg          ctermfg=229
hi MoreMsg          ctermfg=229
hi Operator         ctermfg=161

" complete menu
hi Pmenu            ctermfg=81      ctermbg=16
hi PmenuSel         ctermfg=255     ctermbg=242
hi PmenuSbar                        ctermbg=232
hi PmenuThumb       ctermfg=81

hi PreCondit        ctermfg=118                     cterm=bold
hi PreProc          ctermfg=118
hi Question         ctermfg=81
hi Repeat           ctermfg=161                     cterm=bold
hi Search           ctermfg=0       ctermbg=222     cterm=NONE

" marks column
hi SignColumn       ctermfg=118     ctermbg=235
hi SpecialChar      ctermfg=161                     cterm=bold
hi SpecialComment   ctermfg=245                     cterm=bold
hi Special          ctermfg=81
if has("spell")
    hi SpellBad                     ctermbg=52
    hi SpellCap                     ctermbg=17
    hi SpellLocal                   ctermbg=17
    hi SpellRare    ctermfg=none    ctermbg=none    cterm=reverse
endif
hi Statement        ctermfg=161                     cterm=bold
hi StatusLine       ctermfg=238     ctermbg=253
hi StatusLineNC     ctermfg=244     ctermbg=232
hi StorageClass     ctermfg=208
hi Structure        ctermfg=81
hi Tag              ctermfg=161
hi Title            ctermfg=166
hi Todo             ctermfg=231     ctermbg=232     cterm=bold

hi Typedef          ctermfg=81
hi Type             ctermfg=81                      cterm=none
hi Underlined       ctermfg=244                     cterm=underline

hi VertSplit        ctermfg=244     ctermbg=232     cterm=bold
hi VisualNOS                        ctermbg=238
hi Visual                           ctermbg=235
hi WarningMsg       ctermfg=231     ctermbg=238     cterm=bold
hi WildMenu         ctermfg=81      ctermbg=16

hi Comment          ctermfg=59
hi CursorColumn                     ctermbg=236
hi ColorColumn                      ctermbg=236
hi LineNr           ctermfg=220     ctermbg=236
hi NonText          ctermfg=59

hi SpecialKey       ctermfg=59
