$GitPath = "C:\Users\lucas\.gemini\antigravity\scratch\mingit\cmd\git.exe"

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  PUBLICANDO PORTFOLIO NO GITHUB (Nicoly Silva)" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

Set-Location "C:\Users\lucas\.gemini\antigravity\scratch\portfolio-nicoly"

& $GitPath init
& $GitPath config user.name "Nicoly Silva"
& $GitPath config user.email "nycolys364@gmail.com"
& $GitPath add .
& $GitPath commit -m "Initial commit: Portfolio Nicoly Silva"
& $GitPath branch -M main
& $GitPath remote remove origin 2>$null
& $GitPath remote add origin https://github.com/nicolys363-stack/Portfolio-.git
& $GitPath push -u origin main

Write-Host ""
Write-Host "Publicacao concluida!" -ForegroundColor Green
Read-Host -Prompt "Pressione Enter para fechar"
