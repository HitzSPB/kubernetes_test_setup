$PodsAvailable = kubectl get pods

if($PodsAvailable -contains "bolig-sql-server") {
    kubectl create -f $PSScriptRoot/pods/sqlserver.pod.yml
}
else {
    kubectl apply -f $PSScriptRoot/pods/sqlserver.pod.yml
}

# Log information to check what is running


# Write-Host "---"
# Write-Host $PodsAvailable