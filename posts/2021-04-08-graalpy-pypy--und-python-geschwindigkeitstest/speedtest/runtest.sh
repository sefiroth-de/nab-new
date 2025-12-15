#!/bin/sh

in="${1:-pyenv-versions.txt}"

[ ! -f "$in" ] && { echo "$0 - File $in not found."; exit 1; }

echo -n "## Die Ergebnisse des Test vom $(date +%Y-%m-%d\ %H:%M:%S) ($(uname -m -n -p -r))" > logfile

IFS=$'\n' # set the Internal Field Separator to newline
# printf "%q\n" "$IFS"
while read -r pytn
do
    ## avoid commented filename ##
    [[ $pytn = \#* ]] && echo "\n\n- ${pytn#*\# }:" >> logfile && continue
    pyenv local $pytn
    echo "******************************************************************"
    echo "Aktuelle Python Version ($pytn):"
    python --version -V
    echo -n "    - $(python --version -V)" >> logfile
    echo " \\" >> logfile
    echo "      $(python -m timeit -r 50 -n 5 'import nqueens; nqueens.main()')" >> logfile
    echo "------------------------------------------------------------------"
done < "${in}"

