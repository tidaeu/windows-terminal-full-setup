
# Path to your PowerShell profile
$profilePath = $PROFILE

# The line you want to add
$lineToAdd = '. $HOME/.config/powershell/profile.ps1'

# Add the line to the profile
Add-Content -Path $profilePath -Value $lineToAdd
