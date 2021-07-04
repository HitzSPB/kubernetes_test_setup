$BaseDir = "c:\k"
New-Item -Path "c:\" -Name "k" -ItemType "directory"
Set-Location -Path $BaseDir
$ProgressPreference=’SilentlyContinue’
Invoke-WebRequest -outf kubernetes-node-windows-amd64.tar.gz "https://dl.k8s.io/v1.15.1/kubernetes-node-windows-amd64.tar.gz"
tar -xkf kubernetes-node-windows-amd64.tar.gz -C $BaseDir
Move-Item $BaseDir\kubernetes\node\bin\*.exe $BaseDir

Write-Host "Setting environment paths"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$BaseDir", "Machine")
[Environment]::SetEnvironmentVariable("KUBECONFIG", "$BaseDir\config", "User")

Write-Host "Setting environments"
$NetworkMode="overlay"
$ClusterCIDR="10.244.0.0/16"
$KubeDnsServiceIP="10.96.0.10"
$ServiceCIDR="10.96.0.0/12"
$InterfaceName="Ethernet"
$LogDir="$BaseDir`logs"
$NetworkMode = $NetworkMode.ToLower()
$NetworkName = "vxlan0"
$GithubSDNRepository = 'Microsoft/SDN'
$helper = "$BaseDir\helper.psm1"

Write-Host "Testing Helper path"
if (!(Test-Path $helper)) {
    Write-Host "Enter helper path was not found"
    Start-BitsTransfer "https://raw.githubusercontent.com/$GithubSDNRepository/master/Kubernetes/windows/helper.psm1" -Destination $BaseDir\helper.psm1
}

# Importing module helper
Write-Host "Import module helper"
Import-Module $helper

Write-Host "Setting install path"
$install = "$BaseDir\install.ps1"
Write-Host "Testing install path"
if (!(Test-Path $install)) {
    Start-BitsTransfer "https://raw.githubusercontent.com/$GithubSDNRepository/master/Kubernetes/windows/install.ps1" -Destination $BaseDir\install.ps1
}

Write-Host "Installing Kubernetes"
& $install -NetworkMode "$NetworkMode" -clusterCIDR "$ClusterCIDR" -KubeDnsServiceIP "$KubeDnsServiceIP" -serviceCIDR "$ServiceCIDR" -InterfaceName "'$InterfaceName'" -LogDir "$LogDir"
