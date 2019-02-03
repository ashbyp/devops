import os
import time

path="C:\\VIDEO"  
PRESET="Normal"
EXE='C:\\Program Files (x86)\\Handbrake\\HandBrakeCLI'

commands = []
for root, subFolders, files in os.walk(path):
    for fname in files: 
        if (fname.endswith('.mkv')):
            basename = fname[0:-4]            
	    filename = root + '\\' + basename + '.mp4'
	    if not os.path.isfile(filename):
            	command = r'"' + EXE + '" -i "' + root + '\\' + fname + '" -o "' + root + '\\' + basename + '.mp4" --preset=' + PRESET
            	commands.append(command)
            
out = open('CONVERT' + str(time.time()) + '.BAT', 'w')
for c in commands:
        print >> out, c
out.close()
