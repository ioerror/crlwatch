#!/bin/bash
#
# This parses a CRL into human readable text
#
openssl crl -inform DER -in $1 -text -fingerprint -issuer -fingerprint -hash \
            -crlnumber -noout -lastupdate -nextupdate
