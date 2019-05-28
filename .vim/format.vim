" Force C++ code into google style
" Copyright 2017 Mamoru Kaminaga
function! Format()
  " Before hand.
  :retab!
  :%s/\s\+$//ge

  " About ()
  :%s/\([^ ]*\)\ *(/\1(/ge
  :%s/(\ *\([^ ]*\)/(\1/ge
  :%s/\([^ ]*\)\ *\ *)/\1)/ge
  :%s/\(\ *\)if(/\1if\ (/ge
  :%s/\(\ *\)for(/\1for\ (/ge
  :%s/\(\ *\)while(/\1while\ (/ge
  :%s/\(\ *\)switch(/\1switch\ (/ge

  " About []
  :%s/\([^ ]*\)\ *\[/\1[/ge
  :%s/\[\ *\([^ ]*\)/[\1/ge
  :%s/\([^ ]*\)\ *\]/\1]/ge

  " About else
  :%s/}\ *\n*\ *else\ *\n*\ *{/}\ else\ {/ge

  " About indent
  :%s/)\ *\n*\ *{/)\ {/ge

  " About class
  :%s/class\ *\([^ ]*\)\ *\n*\ *{/class\ \1\ {/ge

  " About namespace
  :%s/namespace\ *\([^ ]*\)\ *\n*\ *{/namespace\ \1\ {/ge

  " About ==, <=, >=, +=, -=, |=, !=, *=, ^=. ~=
  :%s/\([^ ]*\)\ *==\ *\([^ ]*\)/\1\ ==\ \2/ge
  :%s/\([^ ]*\)\ *<=\ *\([^ ]*\)/\1\ <=\ \2/ge
  :%s/\([^ ]*\)\ *>=\ *\([^ ]*\)/\1\ >=\ \2/ge
  :%s/\([^ ]*\)\ *+=\ *\([^ ]*\)/\1\ +=\ \2/ge
  :%s/\([^ ]*\)\ *-=\ *\([^ ]*\)/\1\ -=\ \2/ge
  :%s/\([^ ]*\)\ *|=\ *\([^ ]*\)/\1\ |=\ \2/ge
  :%s/\([^ ]*\)\ *!=\ *\([^ ]*\)/\1\ !=\ \2/ge
  :%s/\([^ ]*\)\ *\*=\ *\([^ ]*\)/\1\ \*=\ \2/ge
  :%s/\([^ ]*\)\ *\^=\ *\([^ ]*\)/\1\ \^=\ \2/ge
  :%s/\([^ ]*\)\ *\~=\ *\([^ ]*\)/\1\ \~=\ \2/ge

  " About ||, &&
  :%s/\([^|]\)\ *||\ *\([^|]\)/\1\ ||\ \2/ge
  :%s/\([^|]\)\ *&&\ *\([^|]\)/\1\ \&\&\ \2/ge

  " About =
  :%s/=\ *\([^= ]\)/=\ \1/ge
  :%s/\([^=<>+-]\)\ *=\([^=]\)/\1\ =\ \2/ge
  :%s/\ *=\ */\ =\ /ge
  :%s/=\ \ =/==/ge
  :%s/|\ =/|=/ge
  :%s/!\ =/!=/ge
  :%s/\*\ =/\*=/ge
  :%s/\^\ =/\^=/ge
  :%s/\~\ =/\~=/ge

  " About <, >
  :%s/#include\ *<\([^>]*\)>/#include\ ,\1,/ge " , is a dummy character.
  :%s/->/-DUMMYCHAR/ge
  :%s/\([^ ]*\)\ *<\ *\([^ ]*\)/\1\ <\ \2/ge
  :%s/\([^ ]*\)\ *>\ *\([^ ]*\)/\1\ >\ \2/ge
  :%s/#include\ *,\([^,]*\),/#include\ <\1>/ge
  :%s/-DUMMYCHAR/->/ge

  " About ,
  :%s/,\([^ ]\)/,\ \1/ge

  " About return
  :%s/\(^\n\)\{2,}/\r/ge " Duplicate is removed

  " About indent
  :normal! gg=G

  " About properties
  " :%s/\ *public\ *:/\ public:/ge
  " :%s/\ *private\ *:/\ private:/ge
  " :%s/\ *protected\ *:/\ protected:/ge

  "Fix
  :%s/&\ =/\&=/ge
  :%s/+\ =/+=/ge
  :%s/-\ =/-=/ge
  :%s/*\ =/*=/ge
  :%s/~\ =/~=/ge
  :%s/^\ =/^=/ge
  :%s/|\ =/|=/ge
  :%s/\/\ =/\/=/ge
  :%s/>\ >/>>/ge
  :%s/<\ </<</ge
  :%s/;[^/]*\//;\ \ \//g
endfunction

command! Format call Format()

nnoremap t <Nop>

function! ToSnakeCase()
  let s:before=expand("<cword>")
  " Initial to lower case, e.g, AbcDef -> abcDef
  let s:after=substitute(s:before, '^[A-Z]', '\l\0', 'g')
  execute ':%s/'.s:before.'/'.s:after.'/ge'
  " Non initial to lower case, e.g, abcDef -> abc_def
  let s:before=s:after
  let s:after=substitute(s:before, '\([a-z]\)\([A-Z]\)', '\1_\l\2', 'g')
  execute ':%s/'.s:before.'/'.s:after.'/ge'
endfunction

nnoremap ts :call ToSnakeCase()<CR>

function! ToPascalCase()
  let s:before=expand("<cword>")
  " ex) abc_def_ghi -> AbcDefGhi
  let s:after=substitute(s:before, '_\(.\)', '\u\1', 'g')
  execute ':%s/'.s:before.'/'.s:after.'/ge'
endfunction

nnoremap tp :call ToPascalCase()<CR>

function! ToCamelCase()
  let s:before=expand("<cword>")
  " ex) abc_def_ghi -> AbcDefGhi
  let s:after=substitute(s:before, '_\(.\)', '\u\1', 'g')
  execute ':%s/'.s:before.'/'.s:after.'/ge'
  " ex) AbcDefGhi -> abcDefGhi
  let s:before=s:after
  let s:after=substitute(s:before, '^', '\u\0', 'g')
  execute ':%s/'.s:before.'/'.s:after.'/ge'
endfunction

nnoremap tc :call ToCamelCase()<CR>
