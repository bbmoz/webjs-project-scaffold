#!/bin/bash

set -ex

NGROK_DIR=~/.ngrok2/

rm -rf ${NGROK_DIR}
mkdir -p ${NGROK_DIR}
cp ~/workspace/webjs-project-scaffold/misc/ngrok/ngrok.yml ${NGROK_DIR}
ngrok start app
