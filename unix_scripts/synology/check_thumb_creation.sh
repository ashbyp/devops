#!/bin/bash
#
# Check thumbnail process, needs to be run as root to read /proc

PID=`pidof synomkthumbd`
echo "PID of synomkthumbd is $PID"

echo "Open file descriptors"
ls -l /proc/$PID/fd

while true; do
   read -p "Restart daemon? " yn
   case $yn in
      [Yy]* ) echo "synoservicecfg --restart synomkthumbd"; break;;
      [Nn]* ) exit;;
      * ) echo "Please answer yes or no.";;
   esac
done

