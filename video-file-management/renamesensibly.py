import os

path="C:\\VIDEO"  

def expand(fname):
    return path + "\\" + fname

dirList=[x for x in os.listdir(path) if os.path.isdir(expand(x)) and x != 'bin']

d = {}
for fname in dirList:
    toUpper = True
    result = ''
    for l in fname:
        if toUpper:
            result += l.upper()
            toUpper = False
        elif l == '_' or l == ' ':
            result += ' '
            toUpper = True
        else:
            result += l.lower()
    d[fname] = result

print "DIRECTORY RENAMES"
for fname in d:
    print path + '\\' + fname + ' --> ' + path + '\\' + d[fname]
    os.rename(path + '\\' + fname, path + '\\' + d[fname])     
    
dirList=[x for x in os.listdir(path) if os.path.isdir(expand(x)) and x != 'bin']
d = {}    
for fname in dirList:
    filelist = [x for x in os.listdir(expand(fname))]
    if len(filelist) == 1:
        if filelist[0].endswith('.mkv'):
            d[fname + "\\" + filelist[0]] = \
               fname + '\\' + fname + '.mkv'
            
print "\n\nFILE RENAMES"
for fname in d:
    print path + '\\' + fname + ' --> ' + path + '\\' + d[fname]
    os.rename(path + '\\' + fname, path + '\\' + d[fname])     

raw_input('Press any key to close')
