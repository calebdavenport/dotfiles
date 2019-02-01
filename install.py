#!/usr/bin/python3

import os
from pathlib import Path
from subprocess import run
from shutil import copyfile

# Change the working directory of this script to where it is located
abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)

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
    print("Downloading and Installing Vundle for Vim")
    if not Path("{}/.vim/".format(Path.home())).exists():
        run(["git",
            "clone",
            "https://github.com/VundleVim/Vundle.vim.git",
            "{}/.vim/bundle/Vundle.vim".format(Path.home())])
        run(["vim",
            "+PluginInstall",
            "+qall"])
    else:
        print("~/.vim/ already exists. Install Vundle manually or delete this directory and try again.")
    pass

if confirmcopy(".tmux.conf"):
    try:
        print("Reloading tmux source file")
        run(["tmux",
             "source-file",
             "{}/.tmux.conf".format(Path.home())])
    except KeyError:
        pass
