#!/usr/bin/env bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot $PICTURE"

BLUR="9x8"

$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE
i3lock -i $PICTURE
rm $PICTURE
