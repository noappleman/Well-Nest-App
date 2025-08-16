#!/usr/bin/env bash
# exit on error
set -o errexit

# Install Python version if needed
if [ ! -f runtime.txt ]; then
    echo "python-3.9.13" > runtime.txt
fi

# Install dependencies
echo "Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Set up the database
echo "Setting up database..."
if [ -f "migrations/versions/*.py" ]; then
    python -m flask db upgrade
fi

# Run any seed data if needed
if [ -f "seed_data.py" ]; then
    python -m flask seed-data
fi

echo "Build completed successfully!"
