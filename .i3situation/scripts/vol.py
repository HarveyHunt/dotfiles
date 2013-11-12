#!/usr/bin/python
import subprocess
import time

s = "^ca(1, cmus-remote -v +5%)^ca(3, cmus-remote -v -5%)+-^ca()^ca()"
while True:
    vol = subprocess.check_output(['cmus-remote', '-Q']).decode('utf8').split()[-1]
    vol = 10 - (int(vol) // 10)
    for i in range(10, 0, -1):
        if vol > 0:
            s += "\n^fg(#0d132b)^r({0}x20)".format(i * 2)
        else:
            s += "\n^fg(#70898f)^r({0}x20)".format(i * 2)
        vol -= 1
    s += "\n"
    print(s)
    time.sleep(0.1)
