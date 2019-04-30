import os.path
import re

git_list = 'git_list.md'

if os.path.isfile(git_list) != -1:
     f = open(git_list)
     for l in f:
	   out = re.sub('.*{', '{', l)
	   out = re.sub('.*uri:', 'uri:', out)
	   out = re.sub('}', '', out)
           uri, version = out.split(',')
	   uri = uri[5:]
	   version = version[10:]
 	   cmd = "git clone " + uri + " --branch=" + version
	   to_write_name = "git_cmds.md"
	   to_write = open(to_write_name, 'a')
	   to_write.write(cmd)
       	   to_write.close()
     f.close()
