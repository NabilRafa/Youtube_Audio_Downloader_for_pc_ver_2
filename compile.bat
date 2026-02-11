@echo off
pyinstaller ^
--onefile ^
--noconsole ^
--icon=icon.ico ^
--distpath Compiled ^
--workpath BuildTemp ^
Download_Lagu.py

echo.
echo Build selesai. Tekan tombol apa saja untuk keluar...
pause