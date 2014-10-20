#!/bin/bash

# REQUIRES:
# python3
# xclip
# xvkbd
# setxkbmap

# Getting script location directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $SOURCE == /* ]]; then
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Changing current directory to script location
cd ${DIR}

# saving old clipboard value to variable
OLD_BUFFER="$(xclip -out -selection c)"

# selecting left text with SHIFT + Home
xvkbd -xsendevent -text "\S\[Home]"

# cut to buffer with CTRL + x
xvkbd -xsendevent -text '\Cx'

# reads “X” clipboard
BUFFER="$(xclip -out -selection c)"

# copy correct word to keyboard
python3 corrector.py "${BUFFER}" | tr -d '\n' | xclip -selection c -l 1

# paste correct word
xvkbd -xsendevent -text '\Cv'


# returns back old clipboard value
echo "${OLD_BUFFER}" | tr -d '\n' | xclip -selection c -l 999
