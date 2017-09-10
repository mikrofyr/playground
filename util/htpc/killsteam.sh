#!/bin/bash
ps ux  | grep steam | awk '{print $2}' | while read pid; do kill $pid; done

