@ECHO OFF

echo "Starting Docker..."

tasklist /FI "IMAGENAME eq Docker for Windows.exe" 2>NUL | find /I /N "Docker for Windows.exe">NUL
if Not "%ERRORLEVEL%"=="0" (
start "Docker" "%PROGRAMFILES%\Docker\Docker\Docker for Windows.exe"
)

:startloop
timeout /nobreak 1 1>NUL
docker info 1>NUL 2>NUL
if Not "%ERRORLEVEL%"=="0" goto :startloop
