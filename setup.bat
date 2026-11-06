@echo off
title HomerTools - Setup
color 0D

echo.
echo [*] Mise a jour de pip...
python -m pip install --upgrade pip --quiet
if errorlevel 1 (
    echo [!] Echec mise a jour pip. On continue quand meme.
)


echo.
echo [*] Installation des dependances obligatoires...
echo     (requests, aiohttp, phonenumbers, pyautogui, pyperclip, easyjson )
echo.

python -m pip install --upgrade requests aiohttp phonenumbers pyautogui pyperclip easyjson
if errorlevel 1 (
    echo.
    echo [!] Une ou plusieurs dependances ont echoue.
    echo     Verifie ta connexion internet et relance.
    echo.
    pause
    exit /b 1
)
echo [+] Dependances obligatoires installees.


echo.
echo [*] Installation des dependances optionnelles...
echo     (selenium, mss, pynput, opencv-python, sounddevice, scipy, pywin32, pycryptodome, bcrypt, curl_cffi)
echo.

python -m pip install --upgrade selenium mss pynput opencv-python sounddevice scipy pywin32 pycryptodome bcrypt curl_cffi
echo [+] Instalation Terminée


echo.
echo [*] Verification des imports 
python -c "import requests, aiohttp, phonenumbers, pyautogui, pyperclip; print('[+] Tous les imports obligatoires OK')"
if errorlevel 1 (
    echo.
    echo [!] Un ou plusieurs imports obligatoires ont echoue.
    echo     Relance setup.bat ou installe manuellement.
    echo.
    pause
    exit /b 1
)

echo.
echo [*] Verification des autres imports
python -c "import selenium, mss, pynput, cv2, sounddevice, scipy, win32crypt, Crypto, bcrypt" 2>nul
if errorlevel 1 (
    echo [i] Certains imports optionnels manquent - pas bloquant.
    echo     Les options concernees afficheront un message dans le tool.
) else (
    echo [+] Instalation optionelle terminée
)
