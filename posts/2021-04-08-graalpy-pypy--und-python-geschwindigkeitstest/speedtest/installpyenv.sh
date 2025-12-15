#!/bin/sh

brew update && brew upgrade

in="${1:-pyenv-versions.txt}"

fast=TRUE

[ ! -f "$in" ] && { echo "$0 - File $in not found."; exit 1; }


# Use Homebrew clang instead of Apple clang.
export CC=clang

#IFS=$'\n'
# printf "%q\n" "$IFS"
while read -r pytn
do
    echo "$pytn"
    # avoid commented filename
    [[ $pytn = \#* ]] && continue
    [[ $fast == TRUE ]] && env PYTHON_CONFIGURE_OPTS='--enable-optimizations --with-lto' \
        PYTHON_CFLAGS='-march=native -mtune=native' \
        pyenv install --skip-existing $pytn && continue
    env PYTHON_CONFIGURE_OPTS='--enable-optimizations --with-lto' \
        PYTHON_CFLAGS='-march=native -mtune=native' \
        pyenv install --force --verbose $pytn
done < "${in}"

