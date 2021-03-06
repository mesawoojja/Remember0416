@echo off
echo Build...

2goarray Icon main < ribbon.ico > iconwin.go

rsrc -manifest comctrl6.manifest -ico ribbon.ico -o rsrc.syso

setlocal

echo 32bit windows...
set GOOS=windows
set GOARCH=386

go build -ldflags="-s -w -H windowsgui" -o 0416_32.exe

echo done.
echo.

echo 64 bit windows...
set GOOS=windows
set GOARCH=amd64

go build -ldflags="-s -w -H windowsgui" -o 0416_64.exe

echo done.

endlocal
