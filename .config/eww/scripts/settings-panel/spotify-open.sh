#! /bin/sh

if pgrep -x spotify; then
  # running
  exit 0
else
  # open it
  spotify &
  exit 0
fi
