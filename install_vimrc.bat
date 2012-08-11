@echo off
echo This must be run with Admin rights!
cd %userprofile%
mklink _vimrc vimfiles\_vimrc 
pause
