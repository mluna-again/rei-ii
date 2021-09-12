#! /usr/bin/env python3

from sys import argv
from os import environ

argv = argv[1:]

# truncate text
if len(argv[1]) >= 15:
    title = argv[1][0:15]
    title += '...'
else:
    title = argv[1]
if len(argv[2]) >= 20:
    description = argv[2][0:20]
    description += '...'
else:
    description = argv[2]

text_to_write = f'{title} please-dont-write-me {description}\n'

path = f"{environ['HOME']}/.cache/notifications"
with open(path, 'a') as file:
    file.write(text_to_write)
