#!/bin/sh

echo '
on run argv
  if length of argv is equal to 0
    set command to ""
  else
    set command to item 1 of argv
  end if

  if length of argv is less than 2
    runSimple(command)
  end if

  if length of argv is greater than 1
    set profile to item 2 of argv
    if length of argv is greater than 2
      set winSize to {item 3 of argv, item 4 of argv}
    else
      #set the window size if a value is not passed in:
      set winSize to {640, 640}
    end if
    if length of argv is greater than 4
      set winPos to {item 5 of argv, item 6 of argv}
    else
      set winPos to {50, 500}
    end if

    runWithProfile(command, profile, winSize, winPos)
  end if
end run

on runSimple(command)
  tell application "Terminal"
    activate
    set newTab to do script(command)
  end tell
  return newTab
end runSimple

on runWithProfile(command, profile, winSize, winPos)
  set command to "echo " & winSize
  set newTab to runSimple(command)
  tell application "Terminal" to set current settings of newTab to (first settings set whose name is profile)
  tell application "System Events"
    tell process "Terminal"
      activate
      set size of window 1 to winSize
      set position of window 1 to winPos
    end tell
  end tell
end runWithProfile
' | osascript - "$@" > /dev/null
