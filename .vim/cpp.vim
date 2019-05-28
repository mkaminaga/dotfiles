set cindent

" Doxygen style file header comment template.
inoremap @@F <Space><Space>//<CR>
			\<Space>@file<Space><C-r>=expand("%")<CR><CR>
			\@brief<Space><CR>
			\@author<Space><CR>
			\@date <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><CR>
      \Copyright <C-r>=strftime("%Y")<CR><Space><CR>

inoremap @F @file<Space><C-r>=expand("%")<CR><Space>
inoremap @f @fn<Space><CR>
inoremap @b @brief<Space>
inoremap @D @detail<Space>
inoremap @a @author<Space>
inoremap @d @date <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><Space>

" Doxygen style function comment template.
inoremap @@f <Space><Space>//<CR>
			\<Space>@brief<Space><br><CR>
			\@param [in]<Space><CR>
			\@param [out]<Space><CR>
			\@param [in,out]<Space><CR>
			\@retval<Space><CR>
			\@return<Space><CR>

inoremap @p @param<Space>
inoremap @r @return<Space>
inoremap @R @retval<Space>
inoremap @S @sa<Space>
inoremap @c @class<Space>
inoremap @v @var<Space>
inoremap @s @struct<Space>
inoremap @e @enum<Space>
