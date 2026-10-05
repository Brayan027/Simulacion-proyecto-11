@echo off
title Servidor Web - Clasificador de Documentos AI
echo ======================================================================
echo    SISTEMA INTELIGENTE DE CLASIFICACION Y EXTRACCION DE DOCUMENTOS
echo                     PROYECTO DE AULA 11 (AI)
echo ======================================================================
echo.
echo [*] Iniciando servidor web con Flask, Keras y Motor OCR...
echo [*] Acceda desde su navegador a: http://localhost:5000
echo.
uv run --python 3.11 --with flask --with tensorflow --with pymupdf --with pillow --with winocr --with pymysql python app.py
pause
