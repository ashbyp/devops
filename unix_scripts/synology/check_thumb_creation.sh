#!/bin/bash
#
# Check thumbnail process, needs to be run as root for to read /proc

PID=`pidof synomkthumbd`
echo "PID of synomkthumbd is $PID"

echo "Open file descriptors"
ls -l /proc/$PID/fd

if [ -f "/var/spool/conv_progress_photo" ]; then
   echo "Progress file"
   cat /var/spool/conv_progress_photo
else
   echo "Progress file does not exist"
fi

while true; do
   read -p "Restart daemon? " yn
   case $yn in
      [Yy]* ) synoservicecfg --restart synomkthumbd; break;;
      [Nn]* ) exit;;
      * ) echo "Please answer yes or no.";;
   esac
done

