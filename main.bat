@echo off
echo [1] Install
echo [2] Restore
SET /P choose=Your Choose:
IF /I "%choose%" EQU "1" GOTO dllinstall
IF /I "%choose%" EQU "2" GOTO dllrestore
IF /I "%choose%" NEQ "1" GOTO exitapp
IF /I "%choose%" NEQ "2" GOTO exitapp

:dllinstall
TAKEOWN /F %windir%\System32\Windows.ApplicationModel.Store.dll && icacls %windir%\System32\Windows.ApplicationModel.Store.dll /grant *S-1-3-4:F /t /c /l
TAKEOWN /F %windir%\SysWOW64\Windows.ApplicationModel.Store.dll && icacls %windir%\SysWOW64\Windows.ApplicationModel.Store.dll /grant *S-1-3-4:F /t /c /l
RENAME %windir%\System32\Windows.ApplicationModel.Store.dll Windows.ApplicationModel.Store.dll.backup
RENAME %windir%\SysWOW64\Windows.ApplicationModel.Store.dll Windows.ApplicationModel.Store.dll.backup
COPY /Y .\ModDLL\x64\System32\Windows.ApplicationModel.Store.dll %windir%\System32\Windows.ApplicationModel.Store.dll
COPY /Y .\ModDLL\x64\SysWOW64\Windows.ApplicationModel.Store.dll %windir%\SysWOW64\Windows.ApplicationModel.Store.dll
pause
exit

:dllrestore
TAKEOWN /F %windir%\System32\Windows.ApplicationModel.Store.dll && icacls %windir%\System32\Windows.ApplicationModel.Store.dll /grant *S-1-3-4:F /t /c /l
TAKEOWN /F %windir%\SysWOW64\Windows.ApplicationModel.Store.dll && icacls %windir%\SysWOW64\Windows.ApplicationModel.Store.dll /grant *S-1-3-4:F /t /c /l
DEL /F /Q %windir%\System32\Windows.ApplicationModel.Store.dll
DEL /F /Q %windir%\SysWOW64\Windows.ApplicationModel.Store.dll
RENAME %windir%\System32\Windows.ApplicationModel.Store.dll.backup Windows.ApplicationModel.Store.dll
RENAME %windir%\SysWOW64\Windows.ApplicationModel.Store.dll.backup Windows.ApplicationModel.Store.dll
pause
exit

:exitapp
exit