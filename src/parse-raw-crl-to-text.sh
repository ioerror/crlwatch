#!/bin/bash
#
# This parses a CRL into human readable text
#
openssl crl -in $1 -inform DER -text -fingerprint -issuer -fingerprint -hash \
            -crlnumber -noout -lastupdate -nextupdate
if [ $? == 1 ]; then
  openssl crl -in $1  -text -fingerprint -issuer -fingerprint -hash \
              -crlnumber -noout -lastupdate -nextupdate
fi
