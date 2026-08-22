@echo off
chcp 65001 > nul
echo ==========================================================
echo   🚀 DEPLOY AUTOMATIZADO — PORTFOLIO NICOLY SILVA
echo ==========================================================
echo.

git --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] O executavel do Git nao foi encontrado no sistema.
    echo Por favor, instale o Git pelo link: https://git-scm.com/downloads
    pause
    exit /b 1
)

echo [1/5] Inicializando repositorio Git...
git init
git branch -M main

echo [2/5] Configurando repositorio remoto...
git remote remove origin > nul 2>&1
git remote add origin https://github.com/nicolys363-stack/Portfolio-.git

echo [3/5] Adicionando arquivos...
git add .

echo [4/5] Criando commit profissional...
git commit -m "feat: initial release of professional portfolio for Nicoly Silva"

echo [5/5] Enviando para o GitHub (main)...
git push -u origin main

echo.
echo ==========================================================
echo   Concluido! Verifique em https://github.com/nicolys363-stack/Portfolio-
echo ==========================================================
pause
