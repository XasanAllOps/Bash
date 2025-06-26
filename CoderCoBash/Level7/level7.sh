#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
ORANGE='\033[38;5;208m'
NC='\033[0m'

# -- '-p' allows you to supply a prompt directly to read
# -- '-e' enables interpretation of
read -p "Please enter directory name: " dir_name

if [ -z "$dir_name" ]; then
  echo -e "${RED}No directory name entered 🚨${NC}"
  exit 1
fi

if [ ! -d "$dir_name" ]; then
  echo -e "${RED}There is no directory named '${dir_name}' 😵‍💫${NC}"
  exit 1
else  
  result=$(ls -lh "${dir_name}"/*.txt | sort -k 5 -h | awk '{print $9, $5}')
  if [ -d "$dir_name" ]; then
    echo -e "${GREEN}List of all '.txt' files in ${NC}${BLUE}'${dir_name}'${NC}${GREEN} from smallest to largest:\n${NC}$result"
  fi
fi

# -- sort = sorts lines of text | '-k' = sort by column 5, the file size | '-h' = human-numeric
# -- 'k' tells it which field (or column) to 'sort' on = sort -k 2
# -- by default, sort orders things ascending (smallest to largest), unless you specify '-r' (reverse)
# -- awk = splits each line into fileds using whitespace | {print $9, $5} = filename & file size
# -- \n = new line


