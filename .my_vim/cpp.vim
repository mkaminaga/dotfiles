set cindent

"========Unicode macro in cl"
nnoremap tt a_T("")<Left><Left>
nnoremap ts a_T('')<Left><Left>

"========Small completion========
inoremap {<CR> {}<LEFT><CR><ESC><S-o>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
nnoremap <Esc>; <S-a>;<Esc>

"========Doxygen style comment========
inoremap @@F /**<CR>
			\@file<Space><C-r>=expand("%")<CR><CR>
			\@brief<Space><CR>
			\@author<Space><CR>
			\@date <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><CR>
			\*/

inoremap @@f /**<CR>
			\@brief<Space><br><CR>
			\@param [in]<Space><CR>
			\@param [out]<Space><CR>
			\@param [in,out]<Space><CR>
			\@retval<Space><CR>
			\@return<Space><CR>
			\*/

nnoremap <F2> o/**<Space><Space>*/<Left><Left><Left>
nnoremap <F3> A<Space>/**<<Space><Space>*/<Left><Left><Left>
inoremap @F @file<Space><C-r>=expand("%")<CR><Space>
inoremap @f @fn<Space><CR>
inoremap @b @brief<Space>
inoremap @D @detail<Space>
inoremap @a @author<Space>
inoremap @d @date <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><Space>
inoremap @p @param<Space>
inoremap @r @return<Space>
inoremap @R @retval<Space>
inoremap @S @sa<Space>
inoremap @c @class<Space>
inoremap @v @var<Space>
inoremap @s @struct<Space>
inoremap @e @enum<Space>

"========No doxygen style comment========
inoremap /* /*<Space><Space>*/<Left><Left><Left>
