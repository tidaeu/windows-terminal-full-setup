
# Path to your PowerShell profile
$profilePath = $PROFILE

# The line you want to add
$lineToAdd = '. $HOME/.config/powershell/profile.ps1'

# Add the line to the profile
Add-Content -Path $profilePath -Value $lineToAdd

winget install Neovim.Neovim
winget install CoreyButler.NVMforWindows 

# Telescope dependencies
winget install --id=BurntSushi.ripgrep.MSVC  -e
winget install --id=sharkdp.fd  -e
