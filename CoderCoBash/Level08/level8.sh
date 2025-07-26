#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
ORANGE='\033[38;5;208m'
NC='\033[0m'

read -p "Please enter the name of the directory: " dir_name

if [ -z "${dir_name}" ]; then
  echo -e "${RED}Please enter a directory 🚨${NC}"
  exit 1
fi

read -p "Please enter the keyword you are searching for: " key_word

if [ -z "${key_word}" ]; then
  echo -e "${RED}Please enter a keyword you are looking to search 🔎${NC}"
  exit 1
fi

if [ ! -d "${dir_name}" ]; then
  echo -e "${RED}This directory '${dir_name}' does not exist ⛔️${NC}"
  exit 1
fi

extract=$(grep -l "${key_word}" "${dir_name}"/*.log 2>/dev/null)

if [ -z "$extract" ]; then
  echo -e "${YELLOW}No log files in${NC} '${dir_name}' ${YELLOW}contain the keyword:${NC} '${key_word}'"
else
  echo -e "${GREEN}Here are the log files located in '${dir_name}' containing the keyword '${key_word}':${NC}\n${extract}"
fi
