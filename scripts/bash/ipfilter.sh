#!/bin/bash

if [ ! $# -eq 1 ]; then
  exit 1
fi

if [ ! -f $1 ]; then
  exit 1
fi

grep -Po "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" $1 | sort | uniq
