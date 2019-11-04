#!/bin/bash


if [ $# -lt 1 ]; then
  echo "Usage: md5uniq [path] {--post}"
  exit 1
fi

DRYRUN=1
if [ $# -gt 1 ]; then
  if [ $2 == "--post" ]; then
    DRYRUN=0
  fi
fi

find $1 -maxdepth 1 -type f | while read file; do 
  SUM=`md5sum "$file" | awk '{print $1}'` 
  EXTENSION=`echo ${file##*.}  | tr '[:upper:]' '[:lower:]'`
  if [ "$file" != "$1$SUM.$EXTENSION" ]; then
    echo "$file -> $1$SUM.$EXTENSION"
    if [ $DRYRUN -eq 0 ]; then
      mv "$file" "$1/$SUM.$EXTENSION"
    fi
  fi
done 

