#!/bin/bash
tsleeps=4
echo "Please, run script from sudo!!!"

cd /var/www/extest1
/usr/local/bin/gunicorn -b localhost:8021 backend1_1:apps >> out1.log 2>>err1.log &
sleep $tsleeps

cd /var/www/extest2
/usr/local/bin/gunicorn -b localhost:8022 backend2_1:apps >> out1.log 2>>err1.log &
sleep $tsleeps

cd /var/www/extest3
/usr/local/bin/gunicorn -b localhost:8023 backend3_1:apps >> out1.log 2>>err1.log &
sleep $tsleeps

echo "Start all applications on port [8021 - 8023] and address [extest.ru]"
