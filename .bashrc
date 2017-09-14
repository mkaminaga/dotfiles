#.bash.rc

##################################################################
# alias
##################################################################

# ls: 詳細
alias ls='ls --color=auto --show-control-chars'
alias la='ls -la -l -h'

# vi, vimの起動は複数タブ
alias vim='vim -p'
alias vi='vi -p'

# tree: カラー有効, 階層を指定
alias tree='tree -C -L'

# cpplint (google cording style helper tool)
alias cpplint='cpplint.py'

# 開く
alias c='open'
##################################################################
# オマケ
##################################################################
echo `date "+It is %Y/%m/%d %H:%M:%S"`
