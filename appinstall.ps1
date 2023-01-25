# 1. Make sure the Microsoft App Installer is installed:
#    https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1
# 2. Open Terminal/PowerShell as Administrator
# 3. Place this script on the Desktop and enter this command
#    cd C:\Users\username\Desktop
# 4. Run "Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process" 
#    before running the script to temporarily allow scripts to be run
# 5. Run this script
#    ./appinstall.ps1

Write-Output "Installing Apps"
$apps = @(
    @{name = "7zip.7zip" },
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    @{name = "Google.Chrome" },
    @{name = "Microsoft.dotnet" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.PowerToys" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "Microsoft.WindowsTerminal" },
    @{name = "Mozilla.Firefox" },
    @{name = "Notepad++.Notepad++" },
    @{name = "VideoLAN.VLC" },
    @{name = "Sophos.SophosEndpointAgent" },
    @{name = "Microsoft.Office365 "},
    @{name = "WinDirStat.WinDirStat" },
    @{name = "Zoom.Zoom" }
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
    }
    else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}
