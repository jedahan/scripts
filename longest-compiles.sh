#!/bin/sh

./pint.rb | grep "[1-9][0-9] minute" -B 1 | grep -v '^--$' 
