#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
ORANGE='\033[38;5;208m'
NC='\033[0m'

# -- "-z" checks if the value is empty (zero length)
# -- "$1" is the first argument passed to the script (./level6.sh <insert file>) in this case the file

if [ -z "$1" ]; then
  echo -e "${RED}No file has been provided${NC}"
  exit 1

# -- "wc -l" counts the number of lines
# -- < "$1" feeds the file into wc -l | wc -l "$1" = 42 <filename> with < "$1" outputs only the number.

else
  if [ -f "$1" ]; then
    lines=$(wc -l < "$1")
    echo -e "${GREEN}Number of lines in '$1'${NC}: ${YELLOW}$lines${NC}"
  else 
    echo -e "${RED}No such file found!${NC}"
  fi
fi
