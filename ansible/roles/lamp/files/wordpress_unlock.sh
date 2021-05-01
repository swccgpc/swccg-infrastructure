#!/bin/bash

function wp_unlock() {
  echo
  echo unlocking $1
  echo
  site="$1"

  cd "$site"
    find -type f \
    -exec chmod 0660 {} \; \
    -exec chown www-data:www-data {} \;

  find -type d \
    -exec chmod 0770 "{}" \; \
    -exec chown www-data:www-data "{}" \;

  chown www-data:www-data .
  chmod 0770 .
  chmod 0440 .htaccess wp-config.php
  if [ -f xmlrpc.php ]; then
    rm -f xmlrpc.php
  fi

  cd ..
}

wp_unlock "store.starwarsccg.org"
wp_unlock "www.starwarsccg.org"