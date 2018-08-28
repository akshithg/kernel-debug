#!/bin/bash

set -e

git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "set auto-load safe-path `pwd`/linux" >> ~/.gdbinit
