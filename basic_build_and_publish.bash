#!/bin/bash

if ! poetry >/dev/null 2>&1; then
    echo "python-poetry not installed. Aborting.."
    exit 1
fi

set -ex 
poetry version patch
poetry build
poetry publish -r nas
git add -p .
git commit
git push
