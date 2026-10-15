@echo off
title AI Face Recognition Service (Port 8000)
echo ============================================================
echo   Menjalankan AI Face Recognition Service (DeepFace FastAPI)
echo   Host: http://0.0.0.0:8000
echo ============================================================
cd /d "%~dp0"
if exist venv\Scripts\python.exe (
    venv\Scripts\python.exe -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload
) else (
    echo [ERROR] Virtual environment tidak ditemukan!
    echo Jalankan: python -m venv venv
    echo Lalu: venv\Scripts\pip install -r requirements.txt
)
pause
