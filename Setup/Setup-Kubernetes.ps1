New-Item -Path "c:\" -Name "kubernetes" -ItemType "directory"
Set-Location -Path "c:\kubernetes"
$ProgressPreference=’SilentlyContinue’
Invoke-WebRequest -outf kubernetes-node-windows-amd64.tar.gz "https://dl.k8s.io/v1.15.1/kubernetes-node-windows-amd64.tar.gz"
tar -xkf kubernetes-node-windows-amd64.tar.gz -C C:\kubernetes
Move-Item C:\kubernetes\kubernetes\node\bin\*.exe C:\kubernetes


$NetworkMode="overlay"
$ClusterCIDR="10.244.0.0/16"
$KubeDnsServiceIP="10.96.0.10"
$ServiceCIDR="10.96.0.0/12"
$InterfaceName="Ethernet"
$LogDir="C:\kubernetes`logs"
$BaseDir = "c:\kubernetes"
$NetworkMode = $NetworkMode.ToLower()
$NetworkName = "vxlan0"
$GithubSDNRepository = 'Microsoft/SDN'
$helper = "c:\kubernetes\helper.psm1"

if (!(Test-Path $helper)) {
    Start-BitsTransfer "https://raw.githubusercontent.com/$GithubSDNRepository/master/Kubernetes/windows/helper.psm1" -Destination c:\kubernetes\helper.psm1
}

Import-Module $helper
$install = "c:\kubernetes\install.ps1"
if (!(Test-Path $install)) {
    Start-BitsTransfer "https://raw.githubusercontent.com/$GithubSDNRepository/master/Kubernetes/windows/install.ps1" -Destination c:\kubernetes\install.ps1
}

& $install -NetworkMode "$NetworkMode" -clusterCIDR "$ClusterCIDR" -KubeDnsServiceIP "$KubeDnsServiceIP" -serviceCIDR "$ServiceCIDR" -InterfaceName "'$InterfaceName'" -LogDir "$LogDir"
 