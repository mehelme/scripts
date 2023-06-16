#!/bin/bash

# https://unix.stackexchange.com/questions/117093/find-where-inodes-are-being-used

(for i in $(ls -d */); do echo -n "$i "; find $i | wc -l; done ) | sort -k 2 -n

read -p "PRESS ENTER" x


