@ECHO OFF
ECHO Starting PHP FastCGI...
set PATH=C:\tools\nginx\php;%PATH%
C:\tools\nginx\php\RunHiddenConsole.exe C:\tools\nginx\php\php-cgi.exe -b 127.0.0.1:9123