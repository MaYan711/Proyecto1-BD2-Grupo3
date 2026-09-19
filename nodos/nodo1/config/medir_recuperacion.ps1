Write-Host "Estado inicial:"
Get-Service postgresql-x64-18

Write-Host ""
Write-Host "Deteniendo Nodo 1..."

Stop-Service postgresql-x64-18

do {
    Start-Sleep -Milliseconds 200
    $servicio = Get-Service postgresql-x64-18
} until ($servicio.Status -eq "Stopped")

$momentoCaida = Get-Date

Write-Host "Nodo 1 detenido:" $momentoCaida
Write-Host ""

Write-Host "Iniciando recuperacion..."
$inicioRecuperacion = Get-Date

Start-Service postgresql-x64-18

do {
    Start-Sleep -Milliseconds 200

    pg_isready -h 127.0.0.1 -p 5432 -d databaugs | Out-Null
    $disponible = $LASTEXITCODE
} until ($disponible -eq 0)

$finRecuperacion = Get-Date

$tiempoRecuperacion = $finRecuperacion - $inicioRecuperacion
$tiempoDesdeCaida = $finRecuperacion - $momentoCaida

Write-Host ""
Write-Host "Nodo 1 disponible."
Write-Host "Momento de caida:" $momentoCaida
Write-Host "Inicio de recuperacion:" $inicioRecuperacion
Write-Host "Servicio disponible:" $finRecuperacion
Write-Host "Tiempo de recuperacion local:" $tiempoRecuperacion
Write-Host "Tiempo desde la caida hasta disponibilidad:" $tiempoDesdeCaida