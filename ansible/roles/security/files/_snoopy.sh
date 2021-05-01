#!/bin/bash

grep "libsnoopy.so" /etc/ld.so.preload 1>/dev/null 2>&1
if [ $? -ne 0 ]; then
  export LD_PRELOAD="/lib/$(uname -p)-linux-gnu/libsnoopy.so:${LD_PRELOAD}"
fi
