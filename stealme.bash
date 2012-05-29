#!env bash

for loopnumber in `seq 1 60`
do
  echo "LOOP $loopnumber"
  echo "LOOP $loopnumber" >> ~/Desktop/grabbed.log
  echo "================" >> ~/Desktop/grabbed.log
  find /private/tmp/homebrew-avr-gcc*/ -name 'config.log' | xargs -I XXX cat XXX >> ~/Desktop/grabbed.log
  sleep 5
done
