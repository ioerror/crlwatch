select distinct `X509v3 extensions:Netscape CA Revocation Url` from valid_certs into outfile '/tmp/ns_ca_crls.txt'
select distinct `X509v3 extensions:Netscape Revocation Url` from valid_certs into outfile '/tmp/ns_crls.txt';
