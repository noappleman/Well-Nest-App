#!/bin/bash
set -e  # Exit on error

echo "=== Upgrading pip, setuptools, wheel ==="
python -m pip install --upgrade pip setuptools wheel

echo "=== Installing Python dependencies ==="
pip install --no-cache-dir -r requirements.txt

# Ensure Pillow installs without building from source
pip install --no-cache-dir Pillow==9.5.0

if [ -d "migrations" ]; then
    echo "=== Running database migrations ==="
    python -m flask db upgrade
fi

echo "=== Build successful ==="

