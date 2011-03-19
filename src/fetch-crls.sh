#!/bin/bash -x
#
# Fetch all CRLs listed in a given file
# We use the Torbuton User-Agent to blend in with the Tor crowd.
#

for crl in `cat $1`
do
 savedpath="$(echo "$crl" | shasum -a 1 | awk '{print $1}').crl"
 echo "Fetching $crl";
 usewithtor wget -c --user-agent="Mozilla/5.0 (Windows; U; Windows NT 6.1; LANG; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" \
            -O - "$crl" > "$savedpath" 2>/dev/null;
 if [ $? != 0 ];
 then
   echo "Error fetching $crl" 1>&2;
 else
   echo "Saved $crl to $savedpath";
 fi
done
