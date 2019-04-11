import os.path
import re

if os.path.isfile('SR2withFTS.rosinstall') != -1:
     f = open('SR2withFTS.rosinstall')
     for l in f:
	   out = re.sub('.*{', '{', l)
	   out = re.sub('.*uri:', 'uri:', out)
	   out = re.sub('}', '', out)
           uri, version = out.split(',')
	   uri = uri[4:]
	   version = version[9:]
           print uri
	   print version
	   os.system('git clone ' + uri + ' --branch ' + version)
     f.close()
