#!/bin/bash

set -ex

HOTEL_DIR=~/.hotel/

hotel stop
rm -rf ${HOTEL_DIR}
hotel add -n app 'npm start'
hotel add -n selenium-hub-logs 'docker logs selenium-hub -f'
hotel add -n selenium-node-chrome-logs 'docker logs seleniumgridcc_selenium-chrome_1 -f'
hotel add -n selenium-node-firefox-logs 'docker logs seleniumgridcc_selenium-firefox_1 -f'
hotel start
