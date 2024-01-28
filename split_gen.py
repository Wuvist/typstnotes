# -*- coding:utf-8 -*-

import sys
import os

abspath = os.path.abspath(__file__)
folder = os.path.dirname(abspath)
last_wd = os.getcwd()
os.chdir(folder)

with open('pandoc_tpl.typ', mode='r') as f:
    tpl = f.read()

os.chdir(last_wd)

fname = sys.argv[1]
if "~" in fname:
    fname = fname.split("~")[1]

if not fname.endswith(".typ"):
    print(fname, "must ends with .typ")
    os._exit(1)

with open(fname, mode='r') as f:
    typ = f.read()


sap = """
#block[
split

]"""

parts = typ.split(sap)

i = 1
for part in parts:
    part_name = fname[:-4] + "_" + str(i) + ".typ"
    body = tpl.replace("$body$", part)
    with open(part_name, "w") as f:
        f.write(body)
    i += 1

    print(part_name)
