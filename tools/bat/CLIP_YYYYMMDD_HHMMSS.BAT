@rem date: 2020/08/02
@rem author: Mamoru Kaminaga
@rem about: Date copy tool

chcp 65001
echo %date:~0,4%/%date:~5,2%/%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2% | clip
