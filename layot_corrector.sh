#!/bin/bash

# selecting left text with SHIFT + Home
xvkbd -xsendevent -text "\S\[Home]"

# cut
xdotool key --window "$(xdotool getactivewindow)" ctrl+x

# get selection and remove it from clipboard
BUFFER="$( xsel -cb )"

# get script location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# translate line
CORRECT=$( python3 "$DIR/corrector.py" "${BUFFER}" | tr -d '\n' )

# type corrected
xdotool type --clearmodifiers "$CORRECT"

# switch to other layout with Alt+Shift
# your can change this shortcut
xte 'keydown Alt_L' 'keydown Shift_L' 'keyup Shift_L' 'keyup Alt_L'
