#!/bin/bash

grep "wp-login.php" /var/log/apache2/{store,www}.starwarsccg.org-access.log | \
  grep -v 98.11.9.47 | \
  awk '{print $1;}' | \
  sort -n | uniq -c | sort -n | \
  awk 'BEGIN{
    print "<Directory />";
  }{
    if ($1 >= 4) {
      IP=$2;
      gsub("\\.", "\\\.", IP);
      print "  SetEnvIF X-Forwarded-For \"(,| |^)"IP"(,| |$)\" DenyIP";
    }
  }END{
    print "  Order allow,deny";
    print "  Deny from env=DenyIP";
    print "  Allow from all";
    print "</Directory>";
  }' | tee /etc/apache2/conf-enabled/wp-login-denied-$(date +%Y%m%d).conf

apachectl configtest
if [ $? == 0 ]; then
  systemctl restart apache2
fi