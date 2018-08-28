#!/bin/bash

foo() {
  c=0
  f="/tmp/test_ssd_file"
  while true; do
    c=$((c+1))
    echo "------------------------------ $(date): TRY N [$c]"

    echo "$(date): WRITE"
    dd if=/dev/urandom bs=4MB | pv | dd of=$f bs=4MB # write all free space
    echo "$(date): READ"
    dd if=/dev/sda bs=4MB | pv | dd of=/dev/null
    echo "$(date): RM"
    rm $f
  done

}

sudo bash -c "$(declare -f foo); foo $*"
