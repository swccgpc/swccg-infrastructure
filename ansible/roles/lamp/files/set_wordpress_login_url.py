#!/usr/bin/env python3

import random
import string
import os
import sys

##
## https://www.frameloss.org/2013/04/26/even-easier-brute-force-login-protection-for-wordpress/
##

# The simple truth is most brute-force hacking tools can’t do a lot of things that a real web-browser does all the time.
# Like follow 302 redirects, and use session cookies.

def key_generator(size=25):
  chars = string.ascii_uppercase + string.ascii_lowercase + string.digits
  key   = ''.join(random.choice(chars) for _ in range(size))
  return key


cookie_name = key_generator(25)
url_ending  = key_generator(9)



print(os.popen('a2enmod rewrite').read())
print(os.popen('a2enmod usertrack').read())


fh = open("/etc/apache2/conf-available/wordpress_login_url.conf", "w")
fh.write("  RewriteEngine On\n")
fh.write("   RewriteCond %{HTTP_COOKIE} !"+cookie_name+"\n")
fh.write("   RewriteRule /wp-login.php /starwars-login-"+url_ending+".php [R,L]\n")
fh.write("   <Location /starwars-login-"+url_ending+".php>\n")
fh.write("     CookieTracking on\n")
fh.write("     CookieExpires 30\n")
fh.write("     CookieName "+cookie_name+"\n")
fh.write("   </Location>\n")
fh.write("   RewriteRule /starwars-login-"+url_ending+".php /wp-login.php [NE]\n")
fh.close()

apachectl_configtest_out = os.popen('apachectl configtest 2>&1').read().replace("\n", "")
print("["+apachectl_configtest_out+"]")
if (apachectl_configtest_out == "Syntax OK"):
  print(os.popen('systemctl restart apache2').read())
