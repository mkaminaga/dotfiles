@echo off
rem date: 2020/08/02
rem author: Mamoru Kaminaga
rem about: Create document template and clip it.

cd /d %~dp0
chcp 65001

set TEMPLATE=doc.tmp
type nul > %TEMPLATE%

echo 日時 %date:~0,4%年%date:~5,2%月%date:~8,2%日 >> %TEMPLATE%
echo 作者 %USERNAME% >> %TEMPLATE%
echo. >> %TEMPLATE%
echo. >> %TEMPLATE%

echo ■はじめに >> %TEMPLATE%
echo 　・項目1 >> %TEMPLATE%
echo 　　‐サブ項目1 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%
echo. >> %TEMPLATE%
echo 　　‐サブ項目2 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%
echo. >> %TEMPLATE%
echo. >> %TEMPLATE%

echo ■タスク1 >> %TEMPLATE%
echo 　・項目1 >> %TEMPLATE%
echo 　　‐サブ項目1 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%
echo. >> %TEMPLATE%
echo 　　‐サブ項目2 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%
echo. >> %TEMPLATE%
echo. >> %TEMPLATE%

echo ■タスク2 >> %TEMPLATE%
echo 　・項目1 >> %TEMPLATE%
echo 　　‐サブ項目1 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%
echo. >> %TEMPLATE%
echo 　　‐サブ項目2 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%
echo. >> %TEMPLATE%
echo. >> %TEMPLATE%

echo ■まとめ >> %TEMPLATE%
echo 　・項目1 >> %TEMPLATE%
echo 　　‐サブ項目1 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%
echo. >> %TEMPLATE%
echo 　　‐サブ項目2 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%
echo. >> %TEMPLATE%
echo. >> %TEMPLATE%

echo ■明日の予定 >> %TEMPLATE%
echo 　・項目1 >> %TEMPLATE%
echo 　　‐サブ項目1 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%
echo. >> %TEMPLATE%
echo 　　‐サブ項目2 >> %TEMPLATE%
echo 　　　ほげほげ >> %TEMPLATE%

type nul | clip
clip < %TEMPLATE%
