#!/bin/sh

brew update && brew upgrade

in="${1:-pyenv-versions.txt}"

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
    pyenv install -s $pytn
done < "${in}"

