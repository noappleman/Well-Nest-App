#!/usr/bin/env bash
# exit on error
set -o errexit

echo "=== Starting build process ==="

# Set Python version if not set
if [ ! -f runtime.txt ]; then
    echo "python-3.9.13" > runtime.txt
fi

# Upgrade pip and setuptools
echo "Upgrading pip and setuptools..."
python -m pip install --upgrade pip setuptools wheel

# Install requirements using pip
echo "Installing requirements..."
pip install -r requirements.in

# Install the package in development mode
echo "Installing package in development mode..."
pip install -e .

# Set up the database if migrations exist
if [ -d "migrations" ]; then
    echo "Running database migrations..."
    python -m flask db upgrade
fi

# Run any seed data if it exists
if [ -f "seed_data.py" ]; then
    echo "Running seed data..."
    python -m flask seed-data
fi

echo "=== Build completed successfully ==="
