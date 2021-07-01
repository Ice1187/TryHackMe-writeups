#!/bin/bash

for line in $(cat $2); do curl -s -L -A $line http://$1:80 | wc -c ; echo "--$line"; done
