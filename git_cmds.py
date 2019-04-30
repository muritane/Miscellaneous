import os.path
import re

git_list = 'git_cmds.md'

if os.path.isfile(git_list) != -1:
    f = open(git_list)
    for l in f:
        #print l
        os.system(l)
    f.close()
