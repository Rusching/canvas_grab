#!/usr/bin/pwsh
$ErrorActionPreference = "Stop"

echo "Check Python installation..."
python --version

echo "Check virtual environment..."

if (-Not(Test-Path -Path venv)) {
    echo "Create virtual environment..."
    python -m venv venv
    echo "Activate virtual environment..."
    . ./venv/Scripts/Activate.ps1
    echo "Install dependencies with SJTUG mirror..."
    python -m pip install --upgrade pip -i https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple
    python -m pip install -r requirements.txt -i https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple
    python -m pip install -r requirements.windows.txt -i https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple
} else {
    echo "Activate virtual environment..."
    . ./venv/Scripts/Activate.ps1
}

python main.py $args
