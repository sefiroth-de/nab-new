#!/bin/sh
for pytn in pypy3.11-7.3.19 graalpy-24.1.1 graalpy-community-24.1.1 3.13.5 graalpy-24.2.1 graalpy-community-24.2.1; do
  pyenv local $pytn
  echo "******************************************************************"
  echo "Aktuelle Python Version ($pytn): "
  python --version
  echo "------------------------------------------------------------------"
  python -m timeit -r 50 -n 1 "import nqueens; nqueens.main()"
done;
