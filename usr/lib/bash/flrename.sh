#!/bin/bash

if [ ! -f names ]; then
  echo "Error: No names file"
  exit 1
fi

POST=0
if [ $# -gt 0 ]; then
  if [ $1 == "--post" ]; then
    POST=1
  fi
fi

CNT=1
while read line; do

  NEWFILE=`awk "NR==$CNT" names `
  EXTENSION=`echo $line | rev | cut -d '.' -f 1 | rev`
  echo "mv '$line' '${NEWFILE}.${EXTENSION}'"
  if [ $POST -eq 1 ]; then
    mv "$line" "${NEWFILE}.${EXTENSION}"
  fi
  let CNT=$CNT+1
done
