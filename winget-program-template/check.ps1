Param (
	[String[]]$ProgramName
	)

$ProgramFiles = "$Env:Programfiles"
Start-Transcript -Path "$ProgramFiles\_MEM\Log\$ProgramName-install.log" -Force -Append

# resolve winget_exe
$WingetPath =  (Resolve-Path "$ProgramFiles\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe")[-1].path


If ($WingetPath){
    $ProcessResult = Start-Process -wait -NoNewWindow -FilePath "$($WingetPath)\winget.exe" -ArgumentList "list --exact --id $ProgramName  --accept-source-agreements"
        if ($ProcessResult -like "*$ProgramName*"){
			Write-Host "$ProgramName is installed."
		}

	}
Else {
	Write-Error "Winget not installed"
	}

Stop-Transcript
