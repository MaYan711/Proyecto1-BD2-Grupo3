$env:PGPASSWORD="AppBD2_2026"

$inicio = Get-Date

Write-Host "Inicio de falla:" $inicio.ToString("yyyy-MM-dd HH:mm:ss.fff")

Stop-Service postgresql-x64-18

do {
    Start-Sleep -Milliseconds 100

    $resultado = psql `
        -h 100.89.187.125 `
        -p 6432 `
        -U app_databaugs `
        -d databaugs `
        -t -A `
        -c "SELECT inet_server_addr();" 2>$null

} until (
    $LASTEXITCODE -eq 0 -and
    $resultado.Trim() -eq "100.100.231.68"
)

$fin = Get-Date

Write-Host "Failover completado:" $fin.ToString("yyyy-MM-dd HH:mm:ss.fff")
Write-Host "Nodo atendiendo:" $resultado.Trim()
Write-Host "RTO segundos:" ([math]::Round(($fin - $inicio).TotalSeconds,3))

Remove-Item Env:PGPASSWORD
