#!/bin/sh
brew update
brew upgrade

# brew install libtommath
#set -e
in="${1:-pyenv-versions.txt}"

[ ! -f "$in" ] && { echo "$0 - File $in not found."; exit 1; }

#while IFS= read -r file
IFS=$'\n' # set the Internal Field Separator to newline
while read -r file
do
	## avoid commented filename ##
	[[ $file = \#* ]] && continue
	pyenv install $file
done < "${in}"
