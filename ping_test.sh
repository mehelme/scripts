#!/bin/bash

# simple channel test with ping on some internet servers

for HOST in 77.88.8.8 8.8.8.8 8.8.4.4 1.1.1.1 ya.ru google.com duckduckgo.com; do
    [[ $HOST =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] && IP=$HOST || IP=$(host -4 $HOST | head -n 1 | awk '{print $4}')
    PING=$(ping $IP -w 1 | grep icmp_seq)
    printf "%-16s %-16s %s\n" $HOST $IP "$PING"
done

