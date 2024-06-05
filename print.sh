#!/bin/bash

# Uncomment to debug
# set -x

# Print $1 to stderr and return $2 (or -1 if omitted)
function error {
    echo >&2 $1
    exit ${2:--1}
}

[[ -f index.html ]] || error "No index.html found. Run this script from the repository root." 1
${GOOGLE_CHROME_COMMAND:=google-chrome} --headless --print-to-pdf --no-pdf-header-footer index.html || error "Could not generate the PDF file" $?
