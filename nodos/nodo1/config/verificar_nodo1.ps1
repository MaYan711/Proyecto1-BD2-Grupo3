Get-Service postgresql-x64-18

netstat -ano | findstr :5432

tailscale status

tailscale ip -4

Get-NetFirewallRule -DisplayName "PostgreSQL 18 - Tailscale" |
Select-Object DisplayName, Enabled, Direction, Action