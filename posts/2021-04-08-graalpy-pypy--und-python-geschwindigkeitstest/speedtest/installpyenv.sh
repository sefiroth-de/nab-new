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
    [[ $pytn == \#* ]] && \
        continue
    # default options and cflags
    MY_PY_CONFIG_OPS='--enable-optimizations --with-lto'
    MY_PY_CFLAGS='-march=native -mtune=native'
    # change default, when *t pythons
    [[ $pytn == *t ]] && { MY_PY_CONFIG_OPS=$MY_PY_CONFIG_OPS; }
    # '--enable-experimental-jit=yes-off'
    [[ $fast == TRUE ]] && \
        env PYTHON_CONFIGURE_OPTS=$MY_PY_CONFIG_OPS \
            PYTHON_CFLAGS=$MY_PY_CFLAGS \
            pyenv install --skip-existing --verbose $pytn && \
            continue
    env PYTHON_CONFIGURE_OPTS=${MY_PY_CONFIG_OPS} \
        PYTHON_CFLAGS=$MY_PY_CFLAGS \
        pyenv install --force --verbose $pytn
done < "${in}"
