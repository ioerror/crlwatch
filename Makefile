update: parse-master-list fetch-crls parse-and-commit
	echo "If you're here - we hope you had a nice ride"

parse-master-list:
	cd crl-raw && ../src/parse-crl-list.py raw-crl-sql-output-list.txt \
		|sort|uniq > master-crl-list.txt

fetch-crls:
	cd crl-raw && ../src/fetch-crls.sh master-crl-list.txt

parse-and-commit:
	cd crl-raw && ../src/git-commit-crl-data.sh master-crl-list.txt
