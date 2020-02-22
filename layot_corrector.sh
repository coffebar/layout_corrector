#!/bin/bash

# REQUIRES:
# python3
# xsel
# xvkbd
# setxkbmap


# saving old clipboard value to variable
OLD_BUFFER="$(xsel --clipboard)"

# selecting left text with SHIFT + Home 
xvkbd -xsendevent -text "\S\[Home]"

# and cut to buffer SHIFT+Del
xvkbd -xsendevent -text '\S\[Delete]'

# reads “X” clipboard
BUFFER="$(xsel --clipboard)"

# get script location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# copy correct word to keyboard
python3 "$DIR/corrector.py" "${BUFFER}" | tr -d '\n' | xsel -b -i

# paste correct word
xvkbd -xsendevent -text '\S\[Insert]'

# return back old clipboard value
echo "${OLD_BUFFER}" | tr -d '\n' | xsel -b -i
