#!/usr/bin/python3

import os
from pathlib import Path
from subprocess import run
from shutil import copyfile

def confirmcopy(filename):
    fulldstpath = "{}/{}".format(Path.home(), filename)
    if Path(fulldstpath).is_file():
        prompt = "Do you want to overwrite {}? [n]: ".format(filename)
        answer = input(prompt)
        if answer.lower() != 'y':
            return False
    print("Copying file {}".format(filename))
    copyfile(filename, fulldstpath)
    return True

if confirmcopy(".bashrc"):
    pass

if confirmcopy(".vimrc"):
    pass

if confirmcopy(".tmux.conf"):
    try:    
        print("Reloading tmux source file")
        run(["tmux",
             "source-file",
             "{}/.tmux.conf".format(Path.home())])
    except KeyError:
        pass
