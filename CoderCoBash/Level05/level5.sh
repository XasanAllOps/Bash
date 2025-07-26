#!/bin/bash

LOG_FILE="file_move.log"
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

move_file (){
  local src_file="$1"
  local dest_dir="$2"
  local timestamp
  timestamp=$(TZ="Europe/London" date +"%d-%m-%Y %H:%M:%S")

  if [[ ! -f "$src_file" ]]; then
    echo -e "${RED}This file does not exist 🚨 ${NC}"
    return 1
  fi

  mkdir -p "${dest_dir}"
  base_name=$(basename "$src_file")

  if [[ -f $dest_dir/$base_name ]]; then
    echo -e "${YELLOW}Warning:${NC} File with the same name exists in $dest_dir."
  fi

  mv "$src_file" "$dest_dir/$base_name"
  echo "$timestamp | MOVED | '$src_file' => '$dest_dir/$base_name'" >> "$LOG_FILE"
  echo -e "${GREEN}Success ✅:${NC} Moved '$src_file' to '$dest_dir'"
}

move_file "$1" "$2"