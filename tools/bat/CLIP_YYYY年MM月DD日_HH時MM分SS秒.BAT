@rem date: 2020/08/02
@rem author: Mamoru Kaminaga
@rem about: Date copy tool

chcp 65001
echo %date:~0,4%年%date:~5,2%月%date:~8,2%日 %time:~0,2%時%time:~3,2%分%time:~6,2%秒 | clip
