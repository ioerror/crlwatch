select distinct `X509v3 extensions:Netscape CA Revocation Url` as CRLs from valid_certs
UNION
select distinct `X509v3 extensions:Netscape Revocation Url` from valid_certs
UNION
select distinct `X509v3 extensions:X509v3 CRL Distribution Points` from valid_certs
UNION
select distinct `X509v3 extensions:Authority Information Access:OCSP - URI` from valid_certs into outfile 'raw-crl-sql-output-list.txt';
