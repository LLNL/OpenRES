@echo off
call C:\JModelica.org-2.2\setenv.bat 64
if %errorlevel% neq 0 pause
"%PYTHONHOME%\python.exe" -i IEEE_39_Buses_base.py
if %errorlevel% neq 0 pause
