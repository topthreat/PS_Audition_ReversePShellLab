# This script is intended to run on Windows 11 Pro that has just been setup. Probably as a virtual machine. The user should be an administrator and powershell should be executed as Admin (Win-R, Powershell, CTRL-SHIFT-ENTER)
# Make sure you set the execution policy e.g. Set-ExecutionPolicy RemoteSigned -Scope CurrentUser. Run this script as an administrator ()
# Enable all firewalls and permit internal inbound and outbound traffic
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" -Enabled True
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv6-In)" -Enabled True

# Places a PowerShell shortcut on desktop
$ShortcutPath = [Environment]::GetFolderPath("Desktop") + "\PowerShell.lnk"
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Save()

# Downloads and installs MS Visual Code and then adds the PowerShell extension
$ChocoInstallScript = Invoke-WebRequest "https://chocolatey.org/install.ps1" -UseBasicParsing
Invoke-Expression ($ChocoInstallScript.Content)
choco install -y vscode, netcat

# Wait for VSCode to be installed
$VSCodePath = "$env:ProgramFiles\Microsoft VS Code\bin\code.cmd"
$MaxWaitTime = 300
$WaitInterval = 5
$TimeElapsed = 0
while (-not (Test-Path $VSCodePath) -and $TimeElapsed -lt $MaxWaitTime) {
    Start-Sleep -Seconds $WaitInterval
    $TimeElapsed += $WaitInterval
}

if (Test-Path $VSCodePath) {
    Start-Process -FilePath $VSCodePath -ArgumentList "--install-extension", "ms-vscode.powershell" -Wait -NoNewWindow
} else {
    Write-Warning "VSCode installation took longer than expected. Please install the PowerShell extension manually."
}


# Change the desktop background to solid blue
$SolidColorPath = "HKCU:\Control Panel\Colors"
function Set-SolidColorBackground($r, $g, $b) {
    $SPI_SETDESKWALLPAPER = 0x0014
    $SPIF_UPDATEINIFILE = 0x01
    $SPIF_SENDCHANGE = 0x02

    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;

        public class Wallpaper {
            [DllImport("user32.dll", CharSet = CharSet.Auto)]
            public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
        }
"@
    $color = "$r $g $b"
    Set-ItemProperty -Path $SolidColorPath -Name "Background" -Value $color
    [Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, " ", $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
}

Set-SolidColorBackground -r 255 -g 0 -b 0

# Restart the system
$global:ScriptHasRunPath = Join-Path ([System.IO.Path]::GetTempPath()) "ScriptHasRun.txt"

if (-not (Test-Path $global:ScriptHasRunPath)) {
    # Create a file to indicate the script has run once
    New-Item -ItemType File -Path $global:ScriptHasRunPath -Force | Out-Null

    # Restart the system
    Restart-Computer -Force
} else {
    # Remove the temporary file
    Remove-Item -Path $global:ScriptHasRunPath -Force
}
