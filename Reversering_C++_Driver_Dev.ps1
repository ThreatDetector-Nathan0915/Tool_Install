# Check if Chocolatey is installed, and install if not
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
}

# Install Visual Studio 2022 Build Tools with Desktop development with C++ and Windows Driver Kit
choco install visualstudio2022buildtools --params "--add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Component.VC.ATLMFC --add Microsoft.VisualStudio.Component.Windows10SDK.19041 --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64" -y

# Install Windows Driver Kit (WDK) for Windows 11
choco install windows-driver-kit -y

# Install OpenJDK 11 using Chocolatey
choco install openjdk11 -y

# Install CMake, Ninja, Git, and Python
choco install cmake -y
choco install ninja -y
choco install git -y
choco install python -y

# Define the path to the manually downloaded Ghidra zip file and installation path
$ghidraZipPath = "C:\Users\hanep\Downloads\ghidra_11.1.2_PUBLIC_20240709.zip"
$ghidraInstallPath = "C:\Program Files\Ghidra"

# Check if the Ghidra zip file exists
if (-not (Test-Path -Path $ghidraZipPath)) {
    Write-Host "Ghidra zip file not found at $ghidraZipPath. Please download it manually and update the path in the script."
    exit 1
}

# Create installation directory if it doesn't exist
if (-not (Test-Path -Path $ghidraInstallPath)) {
    New-Item -ItemType Directory -Path $ghidraInstallPath
}

# Extract Ghidra
Write-Host "Extracting Ghidra..."
Expand-Archive -Path $ghidraZipPath -DestinationPath $ghidraInstallPath -Force

# Clean up downloaded zip file if needed (optional)
# Remove-Item -Path $ghidraZipPath

# Add Ghidra to PATH (optional)
$envPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
if ($envPath -notcontains "$ghidraInstallPath\ghidra_11.1.2_PUBLIC") {
    [System.Environment]::SetEnvironmentVariable("Path", "$envPath;$ghidraInstallPath\ghidra_11.1.2_PUBLIC", [System.EnvironmentVariableTarget]::Machine)
}

Write-Host "Ghidra has been installed successfully at $ghidraInstallPath"

# Install IDA Free
$idaUrl = "https://out7.hex-rays.com/files/idafree74.zip"
$idaZipPath = "$env:TEMP\idafree.zip"
$idaInstallPath = "C:\Program Files\IDA Free"

# Download IDA Free
Write-Host "Downloading IDA Free..."
Invoke-WebRequest -Uri $idaUrl -OutFile $idaZipPath

# Create installation directory if it doesn't exist
if (-not (Test-Path -Path $idaInstallPath)) {
    New-Item -ItemType Directory -Path $idaInstallPath
}

# Extract IDA Free
Write-Host "Extracting IDA Free..."
Expand-Archive -Path $idaZipPath -DestinationPath $idaInstallPath -Force

# Clean up downloaded zip file
Remove-Item -Path $idaZipPath

# Add IDA Free to PATH (optional)
if ($envPath -notcontains "$idaInstallPath") {
    [System.Environment]::SetEnvironmentVariable("Path", "$envPath;$idaInstallPath", [System.EnvironmentVariableTarget]::Machine)
}

Write-Host "IDA Free has been installed successfully at $idaInstallPath"

Write-Host "All tools have been installed successfully."
