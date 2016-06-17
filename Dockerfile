FROM microsoft/sample-nginx:windowsservercore
MAINTAINER florent.appointaire@gmail.com
RUN powershell -command \
  wget -Uri https://wordpress.org/latest.zip -OutFile C:\tools\latest.zip; \
  wget -Uri http://windows.php.net/downloads/releases/php-5.6.22-nts-Win32-VC11-x86.zip -OutFile C:\tools\php.zip; \
  wget -Uri https://raw.githubusercontent.com/Flodu31/Nginx_Wordpress_WindowsServer/master/nginx.conf -OutFile C:\tools\nginx\conf\nginx.conf; \
  Expand-Archive -Path C:\tools\latest.zip -DestinationPath C:\tools\nginx\html; \
  Expand-Archive -Path C:\tools\php.zip -DestinationPath C:\tools\nginx\php; \
  $items = Get-ChildItem -Path C:\tools\nginx\html\wordpress; \
  Move-Item -Path $items.FullName -Destination C:\tools\nginx\html; \
  wget -Uri https://raw.githubusercontent.com/Flodu31/Nginx_Wordpress_WindowsServer/master/php.ini -OutFile C:\php\php.ini; \
  Remove-Item -Path C:\tools\nginx\html\index.html -Force; \
  Remove-Item -Path C:\tools\nginx\html\wordpress -Force; \
  Remove-Item -Path C:\tools\latest.zip; \
  Remove-Item -Path C:\tools\php.zip
  wget -Uri https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe -OutFile C:\Temp\vcredist_x86.exe; \
  C:\Temp\vcredist_x86.exe /quiet /norestart
CMD C:\\Windows\\System32\\icacls.exe "C:\\tools\\nginx\\html\\wordpress" /grant Everyone:(OI)(CI)F /T
CMD C:\\tools\\nginx\\php\\php-cgi.exe -b 127.0.0.1:9000
CMD start C:\\tools\\nginx\\nginx.exe
EXPOSE 80
