#!/bin/bash -x
#
#
# git-commit-crl-data.sh
# Parse CRL data into plaintext and add both files to our git repo with a
# meaningful comment.
#

for crl in `cat $1`
do
  hash="$(echo "$crl" | sha1sum|cut -f1 -d\  )";
  ../src/parse-raw-crl-to-text.sh $hash.crl > ../crl-parsed/$hash.crl2txt
  git add $hash.crl ../crl-parsed/$hash.crl2txt
  git commit -m "Update $crl into $hash.crl and parsed into ../crl-parsed/$hash.crl2txt" $hash.crl ../crl-parsed/$hash.crl2txt
done
