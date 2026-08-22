@echo off
title Publicando Portfolio no GitHub - Nicoly Silva
echo ========================================================
echo   PUBLICANDO PORTFOLIO NO GITHUB (Nicoly Silva)
echo ========================================================
echo.

set GIT_PATH=C:\Users\lucas\.gemini\antigravity\scratch\mingit\cmd\git.exe

echo [1/4] Inicializando Git...
"%GIT_PATH%" init

echo [2/4] Configurando perfil...
"%GIT_PATH%" config user.name "Nicoly Silva"
"%GIT_PATH%" config user.email "nycolys364@gmail.com"

echo [3/4] Adicionando arquivos e criando commit...
"%GIT_PATH%" add .
"%GIT_PATH%" commit -m "Initial commit: Portfolio Nicoly Silva"
"%GIT_PATH%" branch -M main

echo [4/4] Conectando ao repositori e fazendo Push...
"%GIT_PATH%" remote remove origin >nul 2>&1
"%GIT_PATH%" remote add origin https://github.com/nicolys363-stack/Portfolio-.git
"%GIT_PATH%" push -u origin main

echo.
echo ========================================================
echo   PUBLICACAO CONCLUIDA COM SUCESSO!
echo ========================================================
pause
