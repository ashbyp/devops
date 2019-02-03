import os
import shutil

path='\\\\diskstation\\video'
webdir='\\\\diskstation\\web'

def expand(x):
    return path + "\\" + x

genreList=[x for x in os.listdir(path) if os.path.isdir(expand(x)) and x != '.wd_tv']

d = {}
t = 0
for genre in genreList:
	films = [x for x in os.listdir(expand(genre))]
	d[genre] = films
	t += len(films)

html = open('catalog.html', 'w')
print >> html, '''
<html>
<head>
<title>Films on the Thingy</title>
<!--
BODY {background: #FFFFFF}
A:link {color: #80FF00}
A:visited {color: #FF00FF}
H1 {font-size: 24pt; font-family: arial}
H2 {font-size: 18pt; font-family: braggadocio}
H3 {font size:14pt; font-family: desdemona}
-->
</STYLE>
</head>
<body>
<h2><font color="orange">Films on the Media Server</font></h2>
'''

print >> html, 'Total films %d' % t
print >> html, '<hr>'

for genre in sorted(d):
	print >> html, '<h3>%(genre)s (%(num)d)</h3>' % {'genre':genre , 'num':len(d[genre])}
	print >> html, '<ul>'
	for film in sorted(d[genre]):
		if genre == 'Home Video':
			print >> html, '<li>%s</li>' % film
		else:
			print >> html, '<li>%s&nbsp;&nbsp;----&nbsp;&nbsp; (<a href="http://www.imdb.com/find?q=%s&s=all">imdb</a>) (<a href="http://en.wikipedia.org/w/index.php?search=%s">wiki</a>)</li>' % (film, film, film)
	print >> html, '</ul>'
	print >> html, '<hr>'

print >> html, '''
</body>
</html>
'''

html.close();
shutil.copy2('catalog.html', webdir)
