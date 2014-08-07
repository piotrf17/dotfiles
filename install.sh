#!/bin/bash
# Use gnu stow to install our config packages.  Any existing conflicting
# config files are backed up.

# Target installation directory for config packages.
TARGET=${HOME}

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
  for path in `stow -t ${TARGET} -c ${package} 2>&1 | awk '{print $4}'`
  do
    # Extract root file or directory, i.e from ${HOME}/foo/bar, return foo.
    # There must be a nicer way to do this...
    root=`echo ${path} | sed 's|${TARGET}/||' | awk '{split($1, a, "/"); print a[1]}'`
    if [ "${root}" != "" ]
    then
      path=${HOME}/${root}   
    fi
    echo "Backing up existing file/directory: "${path}
    mv ${path} ${path}.original
  done
done

# Now, stow our default packages.
for package in ${TO_INSTALL}
do
  stow -t ${TARGET} ${package}
done
