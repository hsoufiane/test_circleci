#!/bin/bash

# Detect programming languages in the repository
echo "🔍 Detecting programming languages in the repo..."

LANGUAGES=()

# Check for Java
if find . -name "*.java" | grep -q . || [ -f "pom.xml" ] || [ -f "build.gradle" ]; then
    LANGUAGES+=("Java")
fi

# Check for Python
if find . -name "*.py" | grep -q . || [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    LANGUAGES+=("Python")
fi

# Check for Node.js
if [ -f "package.json" ]; then
    LANGUAGES+=("Node.js")
    
    # Check if it's a React project
    if grep -q '"react"' package.json; then
        LANGUAGES+=("React")
    fi
fi

# Output detected languages
if [ ${#LANGUAGES[@]} -eq 0 ]; then
    echo "❌ No known languages detected."
    exit 1
else
    echo "✅ Detected languages: ${LANGUAGES[*]}"
    exit 0
fi
