#!/usr/bin/python3
# Currently not working...
from os import symlink, getcwd

PREPEND_SRC = '' # getcwd() + '/'
PREPEND_DEST = '/Users/Callum/symlinks/'

FILES = [
    '.zshrc',
    '.zshrc-darwin',
    '.zshrc-linux',
    '.vimrc',
    '.gvimrc',
    '.git-fresh.sh',
]

for i in FILES:
    print(PREPEND_SRC + i, PREPEND_DEST + i)
    symlink(PREPEND_SRC + i, PREPEND_DEST + i)

symlink(PREPEND_DEST + '.zshrc', '/Users/Callum/.zshrc')
