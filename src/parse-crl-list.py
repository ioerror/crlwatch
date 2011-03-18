#!/usr/bin/env python
#
# parse-crl-list.py
#
# Parse the raw output from the observatory into a list of CRLs suitable for
# fetching over Tor.
#

import sys

if len(sys.argv) < 2:
   print """Pass file of distinct CRL distribution points."""
   sys.exit(1)

for x in open(sys.argv[1], 'r').read().split():
      if x.startswith('URI===http'):
            print x[6:]
