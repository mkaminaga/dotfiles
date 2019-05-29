" file /home/mkami/dotfiles/.vim/format.vim
" brief Formatting related scripts.
" author Mamoru Kaminaga

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

function! ToPascalCase()
  let s:before=expand("<cword>")
  " ex) abc_def_ghi -> AbcDefGhi
  let s:after=substitute(s:before, '_\(.\)', '\u\1', 'g')
  execute ':%s/'.s:before.'/'.s:after.'/ge'
endfunction

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
