Param (
	[String[]]$ProgramName
	)

$ProgramFiles = "$Env:Programfiles"
$Nix=Start-Transcript -Path "$ProgramFiles\_MEM\Log\$ProgramName-install.log" -Force -Append

# resolve winget_exe
$WingetPath =  (Resolve-Path "$ProgramFiles\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe")[-1].path


If ($WingetPath){
    $ProcessResult =(&"$($WingetPath)\winget.exe" list --exact --id $ProgramName  --accept-source-agreements)
	If(($ProcessResult)[-1] -like "*$ProgramName*"){Write-Host "$ProgramName is installed"}
	}
Else {
	Write-Error "Winget not installed"
	}

$Nix=Stop-Transcript
Write-Host $Nix