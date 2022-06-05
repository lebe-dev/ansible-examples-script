#!/bin/bash

########################################
# ANSIBLE EXAMPLES SCRIPT
########################################

MODULE_NAME=$1

if [ $# -eq 0 ]; then
  echo "Usage: $0 <module-name>"
  exit 0
fi

CACHE_PATH=~/.cache/ansible-examples
HTML_CACHE_FILE=${MODULE_NAME}_module.html
MD_CACHE_FILE=${MODULE_NAME}_module.md

mkdir -p ${CACHE_PATH}

if [ ! -f "${CACHE_PATH}/${HTML_CACHE_FILE}" ]; then
  wget -q https://docs.ansible.com/ansible/latest/collections/ansible/builtin/${MODULE_NAME}_module.html -O ${CACHE_PATH}/${HTML_CACHE_FILE}

  if [ ! "$?" == "0" ]; then
    echo "unknown module name"
    exit 1
  fi

fi

if [ ! -f "${CACHE_PATH}/${MD_CACHE_FILE}" ]; then
  cat ${CACHE_PATH}/${HTML_CACHE_FILE} | hxnormalize -x | hxselect -c '#examples' | ./html2md > ${CACHE_PATH}/${MD_CACHE_FILE}

  if [ ! "$?" == "0" ]; then
    echo "unable to generate markdown"
    exit 1
  fi
fi

glow ${CACHE_PATH}/${MD_CACHE_FILE}
