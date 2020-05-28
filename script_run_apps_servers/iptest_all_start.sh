#!/bin/bash
tsleeps=4
echo "Please, run script from sudo!!!"

cd /var/www/iptest1
/usr/local/bin/gunicorn -b localhost:8031 backend1_2:apps >> out.log 2>>err.log &
sleep $tsleeps

cd /var/www/iptest2
/usr/local/bin/gunicorn -b localhost:8032 backend2_2:apps >> out.log 2>>err.log &
sleep $tsleeps

cd /var/www/iptest3
/usr/local/bin/gunicorn -b localhost:8033 backend3_2:apps >> out.log 2>>err.log &
sleep $tsleeps

echo "Start all applications on port [8031 - 8033] and address [iptest.ru]"
