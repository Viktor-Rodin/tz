#!/bin/bash
tsleeps=4
echo "Please, run script from sudo!!!"

cd /var/www/newtest1
/usr/local/bin/gunicorn -b localhost:8011 backend1_0:apps >> out2.log 2>>err2.log &
sleep $tsleeps

cd /var/www/newtest2
/usr/local/bin/gunicorn -b localhost:8012 backend2_0:apps >> out2.log 2>>err2.log &
sleep $tsleeps

cd /var/www/newtest3
/usr/local/bin/gunicorn -b localhost:8013 backend3_0:apps >> out2.log 2>>err2.log &
sleep $tsleeps

echo "Start all applications on port [8011 - 8013] and address [newtest.ru]"
