#!/bin/bash

#https://askubuntu.com/questions/992137/how-to-check-that-kpti-is-enabled-on-my-ubuntu

grep CONFIG_PAGE_TABLE_ISOLATION=y /boot/config-`uname -r` && \
echo "patched :)" || echo "unpatched :("

grep cpu_insecure /proc/cpuinfo && echo "patched :)" || echo "unpatched :("

dmesg | grep "Kernel/User page tables isolation: enabled" \
&& echo "patched :)" || echo "unpatched :("
