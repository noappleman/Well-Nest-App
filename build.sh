#!/bin/bash
set -e  # Exit on error

echo "=== Installing system dependencies ==="
sudo apt-get update
sudo apt-get install -y \
    python3-dev \
    python3-setuptools \
    python3-pip \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev

echo "=== Installing Python dependencies ==="
python -m pip install --upgrade pip setuptools wheel
pip install --no-cache-dir -r requirements.txt

# Install Pillow with specific flags if needed
pip uninstall -y Pillow || true
CFLAGS="${CFLAGS} -mavx2" pip install --no-cache-dir --force-reinstall Pillow==9.5.0 --no-binary=:all:

if [ -d "migrations" ]; then
    echo "=== Running database migrations ==="
    python -m flask db upgrade
fi

echo "=== Build successful ==="
