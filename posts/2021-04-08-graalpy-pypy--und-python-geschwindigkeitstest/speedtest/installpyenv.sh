#!/bin/sh
brew update
brew upgrade
brew install libtommath
pyenv install \
  pypy3.11-7.3.19 \
  pypy3.11-7.3.20 \
  graalpy-24.1.1 \
  graalpy-community-24.1.1 \
  graalpy-24.2.1 \
  graalpy-community-24.2.1 \
  graalpy-24.2.2 \
  graalpy-community-24.2.2 \
  graalpy-25.0.1 \
  graalpy-community-25.0.1 \
  3.13.5 \
  3.13.10 \
  3.14.0 \
  3.14.1
