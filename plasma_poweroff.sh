#!/bin/bash

# power off gracefully
# http://how-to.wikia.com/wiki/How_to_gracefully_kill_(close)_programs_and_processes_via_command_line

while [[ -n $(pidof soffice.bin) ]]; do # wait until user saving documents
    wmctrl -c LibreOffice
    sleep .3
done

pkill --oldest chrome
pkill --oldest firefox
pkill --oldest qtcreator
pkill --oldest deadbeef # need plugin signals.so !
pkill --oldest vivaldi
pkill --oldest opera
pkill --oldest java
pkill --oldest Telegram
wmctrl -c "Sublime Text" # unsaved doc marked with dot

qdbus org.kde.ksmserver /KSMServer logout 0 2 2



