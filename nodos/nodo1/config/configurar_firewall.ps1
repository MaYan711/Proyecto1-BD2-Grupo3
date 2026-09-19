New-NetFirewallRule `
    -DisplayName "PostgreSQL 18 - Tailscale" `
    -Direction Inbound `
    -Protocol TCP `
    -LocalPort 5432 `
    -RemoteAddress 100.64.0.0/10 `
    -Action Allow