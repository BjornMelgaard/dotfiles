#!/bin/bash

# substitute C (cop) and R (rails) to note, W (warning) to error
rubocop --format emacs "$@" | sed -e 's/\(^[^ ]\+\ \)[CR]/\1note/' -e 's/\(^[^ ]\+\ \)W/\1error/'
