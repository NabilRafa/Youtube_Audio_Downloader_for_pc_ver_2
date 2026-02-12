@echo off
echo ============================================================
echo Step 1: Download FFmpeg Essentials Build
echo ============================================================
echo.
echo Downloading FFmpeg minimal build (~15MB)...
echo.

REM Download FFmpeg essentials dari official mirror
curl -L "https://github.com/GyanD/codexffmpeg/releases/download/7.1/ffmpeg-7.1-essentials_build.zip" -o ffmpeg_temp.zip

if not exist ffmpeg_temp.zip (
    echo.
    echo ERROR: Gagal download!
    echo Coba download manual dari:
    echo https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip
    echo.
    echo Setelah download, extract dan copy ffmpeg.exe + ffprobe.exe
    echo ke folder yang sama dengan script ini
    echo.
    pause
    exit /b 1
)

echo.
echo Extracting FFmpeg...
echo.

REM Extract menggunakan tar (built-in di Windows 10+)
tar -xf ffmpeg_temp.zip

REM Cari folder hasil extract
for /d %%i in (ffmpeg-*-essentials_build) do (
    echo Found: %%i
    copy "%%i\bin\ffmpeg.exe" ffmpeg.exe
    copy "%%i\bin\ffprobe.exe" ffprobe.exe
    rmdir /s /q "%%i"
)

REM Hapus file zip
del ffmpeg_temp.zip

echo.
echo ============================================================
echo FFmpeg berhasil di-download!
echo File yang dibutuhkan:
echo   - ffmpeg.exe  (~10MB)
echo   - ffprobe.exe (~10MB)
echo ============================================================
echo.

REM Check apakah berhasil
if exist ffmpeg.exe (
    echo [OK] ffmpeg.exe tersedia
) else (
    echo [FAIL] ffmpeg.exe tidak ditemukan
)

if exist ffprobe.exe (
    echo [OK] ffprobe.exe tersedia
) else (
    echo [FAIL] ffprobe.exe tidak ditemukan
)

echo.
echo Lanjut ke Step 2: Jalankan build_with_ffmpeg.bat
echo.
pause
