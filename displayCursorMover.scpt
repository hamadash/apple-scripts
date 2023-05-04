#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title DisplayCursorMover
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author hamadash
# @raycast.authorURL https://raycast.com/hamadash

use AppleScript version "2.8"
use framework "AppKit"

set currentMouseLocation to current application's NSEvent's mouseLocation()
set currentMouseX to x of currentMouseLocation

-- Macbook:          1440 x 900
-- External Display: 1920 x 1080
set DISPLAY_RESOLUTIONS to {{1440, 900}, {1920, 1080}}
-- ???????????????????
set NEW_MOUSE_LOCATIONS to {{720, 380}, {2400, 540}}

set firstDisplayWidth to item 1 of item 1 of DISPLAY_RESOLUTIONS
if currentMouseX > firstDisplayWidth then
  set displayName to "Display1"
  set newMouseX to item 1 of item 1 of NEW_MOUSE_LOCATIONS
  set newMouseY to item 2 of item 1 of NEW_MOUSE_LOCATIONS
else
  set displayName to "Display2"
  set newMouseX to item 1 of item 2 of NEW_MOUSE_LOCATIONS
  set newMouseY to item 2 of item 2 of NEW_MOUSE_LOCATIONS
end if

my moveTo(newMouseX, newMouseY)

on moveTo(newX, newY)
  set point to current application's CGPointZero
  set x of point to newX
  set y of point to newY

  current application's CGPostMouseEvent(point, 1, 1, 0)
end moveTo

-- ???????????????????????????
displayName
