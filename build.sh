#!/usr/bin/env bash
# exit on error
set -o errexit

echo "=== Starting build process ==="

# Set Python version if not set
if [ ! -f runtime.txt ]; then
    echo "python-3.9.13" > runtime.txt
fi

# Upgrade pip and install requirements
echo "Installing requirements..."
python -m pip install --upgrade pip
pip install -r requirements.txt

# Set up the database if migrations exist
if [ -d "migrations" ]; then
    echo "Running database migrations..."
    python -m flask db upgrade
fi

echo "=== Build completed successfully ==="
