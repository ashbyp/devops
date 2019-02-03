'''
Created on 19 Feb 2012

@author: paul
'''

import os, shutil

path = "."
target='_pics_'
target1='_other_'

def save(path, name, targ, pref):
    tname = str(pref) + '_' + name
    c = 1
    while os.path.exists(targ + '\\' + tname):
        tname = name
        i = str.rfind(tname, '.')
        tname = str(pref) + '_' + tname[0:i] + '-' + str(c) + tname[i:]
        c = c+1
        
    fr = path + '\\' + name
    to = targ + '\\' + tname
    print 'copy %s to %s' % (fr, to)
    shutil.copyfile(fr, to)
     
    
if __name__ == '__main__':
    print 'start'
    try:
        os.mkdir(target)
    except:
        pass
    try:
        os.mkdir(target1)
    except:
        pass

    z=0

    for (path, dirs, files) in os.walk(path):
        if not path.endswith(target) and not path.endswith(target1):
            z = z+1   
            print path
            for file in files:
                name = str(file)
                if name.endswith('jpg') or name.endswith('.JPG'):
                    save(path, name, target, z)
                else:
                    save(path, name, target1, z)

