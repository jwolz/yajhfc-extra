#!/usr/bin/python

# Statistics for PO files

import sys, os, re, subprocess, os.path, babel, codecs, time

filelist=['yajhfc/src/yajhfc/i18n/messages',
          'yajhfc/src/yajhfc/i18n/CommandLineOpts',
          'yajhfc-console/i18n/Messages',
          'yajhfc-pdf-plugin/i18n/Messages',
          'FOPPlugin/i18n/FOPMessages']
          
descriptions=['Main application messages (messages.po)',
             'Main application command line option description (CommandLineOpts.po)',
             'Console add-on messages',
             'PDF plugin messages',
             'FOP plugin messages']

GC_base='http://code.google.com/p/yajhfc/source/browse'
GC_repos=['default',
          'default',
          'console',
          'plugin-pdf',
          'fopplugin']
          


sys.stdout = codecs.getwriter("utf-8")(sys.stdout)

langs=[]
langpattern=re.compile("^messages_(\w+)\.po$")
for po in os.listdir(os.path.split(filelist[0])[0]):  
   m = langpattern.match(po)
   if (m):
     langs.append(m.group(1))

if (len(langs)==0):
  print >> sys.stderr, "Error: No translations found at "+filelist[0]+'*.po'
  sys.exit(1)
langs.sort()

version="<unknown>"
util_java=codecs.open("yajhfc/src/yajhfc/Utils.java", "rU", "utf-8")
verpattern=re.compile('\s*public static final String AppVersion = "(.*?)";.*')
for line in util_java:
  vm = verpattern.match(line)
  if (vm):
    version=vm.group(1)
    break
util_java.close()

msgfmtenv=os.environ.copy()
msgfmtenv['LANG'] = 'C'
msgfmtpattern=re.compile('(\d+) translated.*?(?:, (\d+) fuzzy.*?)?(?:, (\d+) untranslated.*?)?\.')

print "<p>This page shows the status of YajHFC translations for version " + version + " as of " + time.strftime("%Y-%m-%d") + ".</p>"
print "<p>If you are missing your language and would like to create a translation for it or if you would like to complete your language's translation, please <a href=\"/support/email-contact\">contact me</a><br />"
print "   An overview of the translation process can be found in the <a href=\"/documentation/wiki/89-translation-guide\">Translation Guide</a>.</p>"

        
i=0
for i in range(0, len(filelist)):
  basefile=filelist[i]
  basedesc=descriptions[i]
  
  print '<h3>' + basedesc + '</h3>'
  print '<table border="1" width="100%">'
  print '<tr><th>Language</th><th>Number of translated messages</th><th>Percent complete</th></tr>'
  for lang in langs:
    filename = basefile + '_' + lang + '.po'
    
    numtrans=-1
    numuntrans=-1
    numfuzzy=-1
    numtotal=-1
    if (os.path.exists(filename)):
      msgfmtout = subprocess.Popen(["msgfmt", "--statistics", filename], stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=msgfmtenv).communicate()[1]
      mpm = msgfmtpattern.match(msgfmtout)
      if (mpm):
        numtrans=int(mpm.group(1))
        if (mpm.group(2)):
          numfuzzy=int(mpm.group(2))
        else:
          numfuzzy=0
        if (mpm.group(3)):
          numuntrans=int(mpm.group(3))
        else:
          numuntrans=0
        numtotal = numtrans+numuntrans+numfuzzy
        
    if (numtotal>0):
      percentage=100 * (numtrans+numfuzzy) / numtotal
    else:
      percentage=0
    
    red   = min(255, (100-percentage) * 255 * 2 / 100)
    green = min(255, percentage * 255 * 2 / 100)
    blue  = 0
    color = ((red * 256) + green) * 256 + blue
    
    
    #red    = 255
    #green  = min(255, percentage * 255 * 4 / 100)
    #blue   = green
    #colorbg= ((red * 256) + green) * 256 + blue
    colorbg=0xffffff

    if (numtrans<0 or numtotal<0):
      transmsg="No translation available"
    else:
      if (numfuzzy>0):
        transmsg="%d of %d messages (%d fuzzy)" % (numtrans, numtotal, numfuzzy)
      else:
        transmsg="%d of %d messages" % (numtrans, numtotal)
      pos = filename.find('/')
      GC_path = GC_base + filename[pos:] + '?repo=' + GC_repos[i]
      transmsg = '<a href="' + GC_path + '">' + transmsg + '</a>'
    
    locale = babel.Locale(lang)
    print " <tr>"
    print "  <td><b>%s</b> (%s / %s)</td>" % (lang, locale.get_display_name("en"), locale.get_display_name())
    print "  <td>%s</td>" % (transmsg)
    print "  <td><div style=\"background-color: #%06X; position: relative;\">" % (colorbg)
    #print "    <div style=\"text-align: center; z-index: 10; display: block; position: relative;\">%d%%</div>" % (percentage)
    print "    <div style=\"position: relative; background-color: #%06X; width: %d%%; text-align: center;\"> %d%%</div>" % (color, percentage, percentage)
    print "  </div></td>"
    print " </tr>"
  
  print """
</table>
<p>&nbsp;</p>"""
  pass
