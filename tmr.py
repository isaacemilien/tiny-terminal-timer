#!/usr/bin/env python3

import sys
from os import system
from time import sleep
from shutil import get_terminal_size
from math import floor
from subprocess import run

def format_time(DURATION):
    seconds = DURATION % 60
    minutes = int((DURATION - seconds) / 60)

    return f"{minutes}m {seconds}s"

def center_termnl_output(text, termnl_width, termnl_height):
    text = text.center(termnl_width)

    for i in range(termnl_height):
        text = "\n" + text

    return text



DURATION = int(sys.argv[1]) * 60

TERMNL_SIZE = get_terminal_size()
TERMNL_WIDTH = TERMNL_SIZE.columns
TERMNL_HEIGHT = floor(TERMNL_SIZE.lines / 2)

remaining_time = DURATION

for i in range(DURATION):
    system('clear')
    
    print(center_termnl_output(format_time(remaining_time), TERMNL_WIDTH, TERMNL_HEIGHT))
    
    remaining_time -= 1
    sleep(1)

system('clear')

run(["paplay", "/usr/share/sounds/freedesktop/stereo/complete.oga"])
