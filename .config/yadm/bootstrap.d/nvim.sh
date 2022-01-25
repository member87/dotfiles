#!/bin/sh

if command -v nvim >/dev/null 2>&1; then
  echo "Bootstraping Vim"
  nvim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
  echo "Completed vim"
fi
