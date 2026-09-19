Write-Host "Estado PostgreSQL:"
Get-Service postgresql-x64-18

Write-Host "Puerto 5432:"
netstat -ano | findstr :5432

Write-Host "Disponibilidad PostgreSQL:"
pg_isready -h 127.0.0.1 -p 5432 -d databaugs

Write-Host "IP Tailscale:"
tailscale ip -4