#!/bin/bash
# Use xstow to install our config packages.  Any existing conflicting
# config files are backed up.

set -e

CONFIG_ROOT=${HOME}/config/dotfiles
TARGET=${HOME}

if [ "$(pwd)" != "${CONFIG_ROOT}" ]; then
  echo "ERROR: Must run install script from ${CONFIG_ROOT}."
  exit
fi

# Default config packages to install.
DEFAULT="bash emacs git screen vim xmonad"

if [[ -z $1 ]]; then
  TO_INSTALL=${DEFAULT}
else
  TO_INSTALL=$1
fi

# First, backup any conflicting files.
for package in ${TO_INSTALL}
do
  for path in `xstow -t ${TARGET} -c ${package} 2>&1 | awk '{print $3}'`
  do
    stowed_path=${TARGET}$(echo ${path} | sed "s|${CONFIG_ROOT}/${package}||")
    echo "Backing up existing file/directory: "${stowed_path}
    mv ${stowed_path} ${stowed_path}.original
  done
done

# Now, stow our default packages.
for package in ${TO_INSTALL}
do
  echo "Installing ${package}"
  xstow -t ${TARGET} ${package}
done
