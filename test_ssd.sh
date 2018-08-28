#!/bin/bash

# Скрипт тестирует SSD
# 1. Создает файл на свободном месте
# 2. Читает весь диск sda
# 3. Удаляет файл
# И так пока не надоест, в syslog не должно быть ошибок
# Скрипт изначально создан для теста диска corsiar force, который дал сбой

foo() {
  c=0
  f="/tmp/test_ssd_file"
  while true; do
    c=$((c+1))
    echo "TRY N $c $f"

    echo "WRITE"
    dd if=/dev/urandom bs=4MB | pv | dd of=$f bs=4MB # write all free space
    echo "READ"
    dd if=/dev/sda bs=4MB | pv | dd of=/dev/null
    echo "RM"
    rm $f
    exit
  done

}

sudo bash -c "$(declare -f foo); foo $*"
