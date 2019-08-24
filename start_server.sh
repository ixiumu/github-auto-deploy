#! /bin/bash

cd $(dirname $0)
php -S 127.0.0.1:81 >/dev/nul 2>&1 &
