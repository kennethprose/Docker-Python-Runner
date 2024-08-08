#!/bin/bash

# Check if REPO_URL is set
if [ -z "$REPO_URL" ]; then
  echo "ERROR: REPO_URL environment variable is not set."
  exit 1
fi

# Clone the repository
git clone "$REPO_URL" repo

# Change directory to the repository
cd repo

# Install specified Python packages
if [ -n "$PYTHON_PACKAGES" ]; then
  pip install $PYTHON_PACKAGES
fi

# Find the first Python file and execute it
PYTHON_FILE=$(find . -type f -name "*.py" | head -n 1)
if [ -z "$PYTHON_FILE" ]; then
  echo "ERROR: No Python file found in the repository."
  exit 1
fi

# Run the Python file
python "$PYTHON_FILE"