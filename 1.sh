#!/bin/bash
sudo trivy image --ignore-unfixed --format json --output data.json nodeapp01
sudo trivy image --severity HIGH nodeapp01
jq '.[].Vulnerabilities[].Severity' data.json > data1.txt
fc=`(grep -o -i CRITICAL data1.txt | wc -l)`
fh=`(grep -o -i HIGH data1.txt | wc -l)`
echo "Critical"$fc
echo "HIGH" $fh
status=0
if [ $fc -gt 10 ]
then
status=1
else
status=0
fi
exit $status
