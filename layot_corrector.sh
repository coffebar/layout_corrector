#!/bin/bash

# selecting left text with SHIFT + Home
xdotool key shift+Home

# cut
xdotool key ctrl+x

# get selection and remove it from clipboard
BUFFER="$( xsel -b )"
xsel -cb

# get script location
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# translate line
CORRECT=$( python3 "$DIR/corrector.py" "${BUFFER}" | tr -d '\n' )

# type corrected
xdotool type --clearmodifiers "$CORRECT"

# switch to other layout with Alt+Shift
# your can change this shortcut
xdotool key alt+shift
