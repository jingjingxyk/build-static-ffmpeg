$__DIR__ = Split-Path -Parent $MyInvocation.MyCommand.Definition
Write-Host  $__DIR__
$__DIR__ = (Get-Location).Path
$__PROJECT__ = $__DIR__

Write-host $__DIR__
Write-Host (Get-Location).Path

cd $__DIR__
pwd


$url = "https://php-cli.jingjingxyk.com/Git-2.47.1-64-bit.exe"
$git_install_package = 'Git-2.47.1-64-bit.exe'
if (-not (Test-Path -Path $git_install_package))
{
    irm $url -outfile $git_install_package
}

& cmd /c start /wait .\Git-2.47.1-64-bit.exe /VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEONEXIT=1 /DIR="C:\Program Files\Git"

$env:PATH += ";C:\Program Files\Git\bin;"


Invoke-Expression -Command "git config --global core.autocrlf false"
Invoke-Expression -Command "git config --global core.eol lf"
Invoke-Expression -Command "git config --global core.ignorecase false"
Invoke-Expression -Command "git config -–global color.ui true"
Invoke-Expression -Command "git config --global --list"


