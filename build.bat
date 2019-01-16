@echo off
@title UOFW Build Tool
Set "SideBar===================================================="
Set "MiddleBar==================" 
@echo %SideBar%%MiddleBar%%SideBar%
@echo %SideBar% UOFW build tool %SideBar%
@echo %SideBar%%MiddleBar%%SideBar%
@echo.
REM set directories and default vars
Set user_inputBuild=NothingChosen
Set user_inputMove=NothingChosen
Set armaDirFound=false
set dest_directory=%CD%
cd uo_sys_Framework
REG QUERY "HKLM\SOFTWARE\WOW6432Node\bohemia interactive\arma 3" /v main> nul
if %errorlevel%==0 set armaDirFound=true
if %errorlevel%==1 goto ArmADirNotFound
for /F "tokens=2*" %%A in ('REG QUERY "HKLM\SOFTWARE\WOW6432Node\bohemia interactive\arma 3" /v main') do set "arma_main_directory=%%B"
@echo ArmA 3 Directory located at:%arma_main_directory%
if not exist "C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" goto :PBOManagerNotFound
goto :build_choice

:PBOManagerNotFound
echo "C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe missing!" This tool needs PBO Manager v.1.4 to make a pbo!"
echo "You can still move the pbo to @UOF\addons\ using this tool"
goto :move_choice

:ArmADirNotFound
@echo ArmA directory not found! Tool will not be able to move the pbo into @UOF\addons.
goto :exit_choice

:ArmADirNotFoundChoice
@echo ArmA directory not found! Tool will not be able to move the pbo into @UOF\addons.
goto :build_choice

:build_choice
@echo %SideBar%%MiddleBar%%SideBar%
set /P user_inputBuild=[Build UOFW pbo? (y/n)]
if "%user_inputBuild%"=="NothingChosen" goto :sub_errorBuild
if /I "%user_inputBuild%"=="y" goto :build_pbo
if /I "%user_inputBuild%"=="n" goto :move_choice
goto :sub_errorBuild

:move_choice
@echo %SideBar%%MiddleBar%%SideBar%
if /I "%armaDirFound%"=="false" goto :exit_choice
set /P user_inputMove=[Move to @UOF\addons? (y/n)]
if "%user_inputMove%"=="NothingChosen" goto :sub_errorMove
if /I "%user_inputMove%"=="y" goto :move_pbo
if /I "%user_inputMove%"=="n" goto :exit_choice
goto :sub_errorMove

:exit_choice
@echo Press any key to exit...
pause >nul 
exit

:sub_errorBuild
@echo Nothing was chosen!
goto :build_choice

:sub_errorMove
@echo Nothing was chosen!
goto :move_choice

:build_pbo
set build_directory=%CD%
>nul "C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "%build_directory%" "%dest_directory%\uo_sys_Framework.pbo"
if %errorlevel% equ 0 @echo PBO built successfully!
goto :move_choice

:move_pbo
>nul xcopy "%dest_directory%\uo_sys_Framework.pbo" "%arma_main_directory%\@UOF\addons\" /Y
if not %errorlevel% equ 0 goto :exit_choice
@echo "PBO moved into @UOF\addons folder"
@echo "Press any key to exit..."
pause>nul
exit