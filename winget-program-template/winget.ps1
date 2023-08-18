$ProgramFiles = "$Env:Programfiles"
Start-Transcript -Path "$ProgramFiles\_MEM\Log\winget-install.log" -Force

# resolve winget_exe
$Nix=$WingetPath =  (Resolve-Path "$ProgramFiles\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe")[-1].path

If ($WingetPath){
	$ProcessResult =(&"$($WingetPath)\winget.exe" $args)
	Write-Host $ProcessResult
	}
Else {
	Write-Error "Winget not installed"
	}

$Nix=Stop-Transcript
Write-Host $Nix