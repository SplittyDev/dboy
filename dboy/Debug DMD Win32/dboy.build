set PATH=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\\bin;C:\Program Files (x86)\Microsoft Visual Studio 14.0\\Common7\IDE;C:\Program Files (x86)\Windows Kits\8.1\\bin;C:\D\dmd2\windows\bin;%PATH%
dmd -g -O -inline -debug -X -Xf"Debug DMD Win32\dboy.json" -deps="Debug DMD Win32\dboy.dep" -c -of"Debug DMD Win32\dboy.obj" semver\semver.d dboy.gb\gameboy.d main.d
if errorlevel 1 goto reportError

set LIB="C:\D\dmd2\windows\bin\..\lib"
echo. > C:\Users\Splitty\DOCUME~1\GitHub\dboy\dboy\DEBUGD~1\DBOYBU~1.LNK
echo "Debug DMD Win32\dboy.obj","Debug DMD Win32\dboy.exe","Debug DMD Win32\dboy.map",user32.lib+ >> C:\Users\Splitty\DOCUME~1\GitHub\dboy\dboy\DEBUGD~1\DBOYBU~1.LNK
echo kernel32.lib/NOMAP/CO/NOI/DELEXE >> C:\Users\Splitty\DOCUME~1\GitHub\dboy\dboy\DEBUGD~1\DBOYBU~1.LNK

"C:\Program Files (x86)\VisualD\pipedmd.exe" -deps "Debug DMD Win32\dboy.lnkdep" C:\D\dmd2\windows\bin\link.exe @C:\Users\Splitty\DOCUME~1\GitHub\dboy\dboy\DEBUGD~1\DBOYBU~1.LNK
if errorlevel 1 goto reportError
if not exist "Debug DMD Win32\dboy.exe" (echo "Debug DMD Win32\dboy.exe" not created! && goto reportError)

goto noError

:reportError
echo Building Debug DMD Win32\dboy.exe failed!

:noError
