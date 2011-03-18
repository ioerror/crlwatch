#!/bin/bash -x
#
# Fetch all CRLs listed in a given file
#

for crl in `cat $1`
do
 echo "Fetching $crl";
 usewithtor wget -c --user-agent="Mozilla/5.0 (Windows; U; Windows NT 6.1; LANG; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" \
            -O $(echo "$crl" | sha1sum|cut -f1 -d\  ).crl "$crl";
 if [ $? != 0 ];
 then
   echo "Error fetching $crl" 1>&2;
 fi
done
