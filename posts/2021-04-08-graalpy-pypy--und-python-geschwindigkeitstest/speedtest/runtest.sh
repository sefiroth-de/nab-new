#!/bin/sh

pyenvlist=(pypy3.11-7.3.19 pypy3.11-7.3.20 3.13.5 3.13.10 3.14.0 3.14.1 graalpy-24.1.1 graalpy-community-24.1.1 graalpy-24.2.1 graalpy-community-24.2.1 graalpy-24.2.2 graalpy-community-24.2.2 graalpy-25.0.1 graalpy-community-25.0.1)

echo "" > logfile

for pytn in $pyenvlist; do
  pyenv local $pytn
  echo "******************************************************************"
  echo "Aktuelle Python Version ($pytn):"
  python --version
  echo -n "- " >> logfile
  python --version >> logfile
  python -m timeit -r 50 -n 5 "import nqueens; nqueens.main()" >> logfile
  echo "------------------------------------------------------------------"
done;
