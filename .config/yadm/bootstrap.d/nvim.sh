#!/bin/sh

if command -v nvim >/dev/null 2>&1; then
  echo "Bootstraping Vim"
  nvim '+PackerInstall' '+PackerCompile'
  echo "Completed vim"
fi
