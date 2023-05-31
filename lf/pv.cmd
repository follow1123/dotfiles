@echo off
setlocal
set file=%1
REM 匹配xml文件
if "%file:~-4%"==".xml" (
	bat --color=always --style=numbers %file%
) else (
	bat --color=always --style=numbers %file%
)
endlocal
