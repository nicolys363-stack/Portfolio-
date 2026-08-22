<#
.SYNOPSIS
    Script de automação DevOps para inicializar o repositório Git e publicar no GitHub.
.DESCRIPTION
    Executa git init, configuração da branch main, staging, commit semântico e git push para o repositório remoto.
#>

$repoUrl = "https://github.com/nicolys363-stack/Portfolio-.git"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  🚀 DEPLOY AUTOMATIZADO — PORTFÓLIO NICOLY SILVA" -ForegroundColor Magenta
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Repositório Remoto: $repoUrl" -ForegroundColor Yellow
Write-Host ""

# 1. Verificar se o Git está instalado
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "❌ ERRO: O executável 'git' não foi encontrado no PATH do sistema." -ForegroundColor Red
    Write-Host "Por favor, instale o Git pelo link oficial: https://git-scm.com/downloads" -ForegroundColor Yellow
    Write-Host "Ou execute no terminal: winget install --id Git.Git -e --source winget" -ForegroundColor Yellow
    exit 1
}

# 2. Inicializar repositório Git se ainda não inicializado
if (-not (Test-Path ".git")) {
    Write-Host "📦 Inicializando repositório Git local..." -ForegroundColor Green
    git init
    git branch -M main
} else {
    Write-Host "ℹ️ Repositório Git já inicializado." -ForegroundColor Cyan
    git branch -M main
}

# 3. Configurar remote origin
$existingRemote = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0 -or -not $existingRemote) {
    Write-Host "🔗 Adicionando remote origin: $repoUrl..." -ForegroundColor Green
    git remote add origin $repoUrl
} else {
    Write-Host "🔗 Atualizando remote origin: $repoUrl..." -ForegroundColor Green
    git remote set-url origin $repoUrl
}

# 4. Adicionar arquivos ao stage
Write-Host "📑 Adicionando arquivos rastreados..." -ForegroundColor Green
git add .

# 5. Criar commit inicial / semântico
$status = git status --porcelain
if ($status) {
    Write-Host "💾 Criando commit: 'feat: initial release of professional portfolio'..." -ForegroundColor Green
    git commit -m "feat: initial release of professional portfolio for Nicoly Silva"
} else {
    Write-Host "ℹ️ Nenhuma alteração pendente para commit." -ForegroundColor Cyan
}

# 6. Realizar git push
Write-Host "🚀 Enviando código para o GitHub (branch main)..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "==========================================================" -ForegroundColor Green
    Write-Host "  ✅ SUCESSO! Repositório publicado no GitHub!" -ForegroundColor Green
    Write-Host "  🔗 Link: https://github.com/nicolys363-stack/Portfolio-" -ForegroundColor Cyan
    Write-Host "==========================================================" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "⚠️ Se o repositório remoto já possuir arquivos (ex: README remoto), execute:" -ForegroundColor Yellow
    Write-Host "   git push -u origin main --force" -ForegroundColor White
}
