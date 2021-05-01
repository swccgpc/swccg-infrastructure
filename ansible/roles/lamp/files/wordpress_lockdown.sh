#!/bin/bash

function wp_lockdown() {
  echo
  echo locking down $1
  echo
  site="$1"

  cd "$site"
    find -type f \
    -exec chmod 0640 {} \; \
    -exec chown root:www-data {} \;

  find -type d \
    -exec chmod 0750 "{}" \; \
    -exec chown root:www-data "{}" \;

  chmod 0770 wp-content/uploads
  if [ -d wp-content/plugins/wp-super-cache ]; then
    chmod 0770 wp-content/plugins/wp-super-cache
  fi
  if [ -d wp-content/uploads/bb-plugin/cache ]; then
    rm wp-content/uploads/bb-plugin/cache/*
    chmod 0770 wp-content/uploads/bb-plugin/cache
  fi
  if [ -d wp-content/uploads/bb-theme ]; then
    chmod 0770 wp-content/uploads/bb-theme
  fi

  if [ -d wp-content/uploads/sucuri ]; then
    chown www-data wp-content/uploads/sucuri
    chown www-data wp-content/uploads/sucuri/*
  fi

  if [ -f wp-content/uploads/sucuri/sucuri-settings.php ]; then
    chmod 0660 wp-content/uploads/sucuri/sucuri-settings.php
  fi

  chown root:www-data .
  chmod 0750 .
  chmod 0440 .htaccess wp-config.php
  if [ -f wp-config-sample.php ]; then
    rm wp-config-sample.php
  fi
  if [ -f readme.html ]; then
    rm readme.html
  fi
  if [ -f xmlrpc.php ]; then
    rm -f xmlrpc.php
  fi
  if [ -f license.txt ]; then
    rm license.txt
  fi

  cd ..
}

wp_lockdown "store.starwarsccg.org"
wp_lockdown "www.starwarsccg.org"