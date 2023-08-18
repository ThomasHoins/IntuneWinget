Param(
    [Parameter(Mandatory=$true)]
    [string[]]
    $AppID,
	[switch]
	$install,
	[switch]
	$uninstall
	
)


$LogPath="$Env:Programfiles\Support\Logs\$AppID-install.log"
Start-Transcript -Path $LogPath -Force -Append


#$WingetPath=(Get-AppxPackage Microsoft.DesktopAppInstaller).InstallLocation
$WingetExePath = (Resolve-Path "$Env:Programfiles\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe\winget.exe").Path

If ([string]::IsNullOrEmpty($WingetExePath))
	{
	& "$PSScriptRoot\InstallWinget.ps1"
	$WingetExePath = (Resolve-Path "$Env:Programfiles\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe\winget.exe").Path
	}
#Else
#	{
#	$WingetExePath="$WingetPath\winget.exe"
#	}

write-host $WingetExePath
write-host "Install $install"

If ($install)
	{
	write-host "running ""$WingetExePath"" install --exact --id $AppID --silent --accept-package-agreements --accept-source-agreements --scope=machine"
	& cmd /c "$WingetExePath" install --exact --id $AppID --silent --accept-package-agreements --accept-source-agreements --scope=machine
	}
Else
	{
	write-host "running ""$WingetExePath"" uninstall --exact --id $AppID --silent ---accept-source-agreements"
	& cmd /c "$WingetExePath" uninstall --exact --id $AppID --silent ---accept-source-agreements
	}
Stop-Transcript