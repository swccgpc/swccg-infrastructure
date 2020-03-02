#!/bin/bash

grep "libsnoopy.so" /etc/ld.so.preload 1>/dev/null 2>&1
if [ $? -ne 0 ]; then
  export LD_PRELOAD="/lib/x86_64-linux-gnu/libsnoopy.so:${LD_PRELOAD}"
fi
