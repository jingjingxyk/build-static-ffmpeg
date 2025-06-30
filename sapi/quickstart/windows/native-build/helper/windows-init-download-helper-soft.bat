setlocal


echo %~dp0
cd /d %~dp0
cd /d .\..\..\..\..\..\

set "__PROJECT__=%cd%"
echo %cd%

md %__PROJECT__%\var\windows-build-deps\

cd /d %__PROJECT__%\var\windows-build-deps\

if not exist "Git-2.50.0-64-bit.exe" curl.exe -fSLo Git-2.50.0-64-bit.exe https://github.com/git-for-windows/git/releases/download/v2.50.0.windows.1/Git-2.50.0-64-bit.exe
if not exist "npp.8.6.7.Installer.x64.exe" curl.exe -fSLo npp.8.6.7.Installer.x64.exe https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.7/npp.8.6.7.Installer.x64.exe
if not exist "socat-v1.8.0.1-cygwin-x64.zip" curl.exe -fSLo socat-v1.8.0.1-cygwin-x64.zip https://github.com/jingjingxyk/build-static-socat/releases/download/v2.2.1/socat-v1.8.0.1-cygwin-x64.zip
if not exist "Microsoft.WindowsTerminal_1.21.3231.0_8wekyb3d8bbwe.msixbundle" curl.exe -fSLo Microsoft.WindowsTerminal_1.21.3231.0_8wekyb3d8bbwe.msixbundle https://github.com/microsoft/terminal/releases/download/v1.21.3231.0/Microsoft.WindowsTerminal_1.21.3231.0_8wekyb3d8bbwe.msixbundle
if not exist "winget-install.ps1" curl.exe -fSLo winget-install.ps1 https://github.com/asheroto/winget-install/releases/latest/download/winget-install.ps1
if not exist "chocolatey-install.ps1" curl.exe -fSLo chocolatey-install.ps1 https://community.chocolatey.org/install.ps1
if not exist "scoop-install.ps1" curl.exe -fSLo scoop-install.ps1 https://get.scoop.sh



if not exist "npp.8.6.7.Installer.x64.exe" curl.exe -fSLo npp.8.6.7.Installer.x64.exe https://php-cli.jingjingxyk.com/npp.8.6.7.Installer.x64.exe

:: https://github.com/dail8859/NotepadNext/
if not exist "vc_redist.x86.exe" curl.exe -fSLo vc_redist.x86.exe https://aka.ms/vs/17/release/vc_redist.x86.exe
if not exist "vc_redist.x64.exe" curl.exe -fSLo vc_redist.x64.exe https://aka.ms/vs/17/release/vc_redist.x64.exe
if not exist "NotepadNext-v0.10-Installer.exe" curl.exe -fSLo NotepadNext-v0.10-Installer.exe  https://php-cli.jingjingxyk.com/NotepadNext-v0.10-Installer.exe

if not exist "wireguard-amd64-0.5.3.msi" curl.exe -fSLo wireguard-amd64-0.5.3.msi  https://download.dengxiaci.com/wireguard-amd64-0.5.3.msi


:: curl.exe -fSLo socat-v1.8.0.1-cygwin-x64.zip  https://php-cli.jingjingxyk.com/socat-v1.8.0.1-cygwin-x64.zip

:: curl.exe -fSLo curl-8.11.1_1-win64-mingw.zip https://curl.se/windows/dl-8.11.1_1/curl-8.11.1_1-win64-mingw.zip
:: curl.exe -fSLo curl-8.11.1_1-win64arm-mingw.zip https://curl.se/windows/dl-8.11.1_1/curl-8.11.1_1-win64a-mingw.zip

:: curl.exe -fSLo NotepadNext-v0.10-Installer.exe  https://github.com/dail8859/NotepadNext/releases/download/v0.10/NotepadNext-v0.10-Installer.exe
:: curl.exe -fSLo NotepadNext-v0.10-Installer.exe  https://php-cli.jingjingxyk.com/NotepadNext-v0.10-Installer.exe

endlocal
