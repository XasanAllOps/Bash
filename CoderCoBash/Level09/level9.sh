#!/bin/bash

RED='\033[1;31m'
YELLOW='\033[0;33m'
BLUE='\033[1;36m'
GREEN='\033[1;32m'
ORANGE='\033[38;5;208m'
NC='\033[0m'

# --- Prompt user to enter a directory to monitor
read -p "Please enter a directory to monitor 🔎: " dir_name

# --- If no input is entered, remind then exit.
if [ -z "$dir_name" ]; then
  echo -e "${RED}Please type in a directory 📝${NC}"
  exit 1
fi

# --- If the directory doesn't exist, show a warning and exit.
if [ ! -d "$dir_name" ]; then
  echo -e "${YELLOW}Whooopsie! This directory does not exist!${NC} => ${YELLOW}Exiting 👋${NC}"
  exit 1
fi

# --- Define the file where all changes will be logged
log_file="monitor_log.txt"

# --- Confirmation messages to user
echo -e "${BLUE}Monitoring directory${NC}: '$dir_name'"
echo -e "${YELLOW}Press Ctrl+C to stop${NC}"

# --- Start monitoring with fswatch
# --- 'fswatch' watches files and directories and outputs paths when changes are detected
# --- '-r' stands for recursive will watch for subdirectories as well
fswatch -r "$dir_name" | while read file; do

  # --- Timestamp in UK time
  timestamp=$(TZ="Europe/London" date "+%d-%m-%Y %H:%M:%S")
  filename=$(basename "$file")

  # --- Ignore swap/temp/hidden for Vim files
  if [[ "$filename" == .* || "$filename" == *~ || "$filename" == *.swp || "$filename" == *.swx || "$filename" == 4913 ]]; then
    continue
  fi

  # --- Shorten path to start from monitored directory
  short_path="${file#*${dir_name}/}"
  if [[ "$short_path" == "$file" ]]; then
    short_path="$filename"
  fi

  # --- Check if the file still exists
  if [ -e "$file" ]; then
    # --- Log modification or creation to console and file
    echo -e "${GREEN}[MODIFIED/CREATED]${NC} '$dir_name/$short_path' at $timestamp"
    echo "[MODIFIED/CREATED] '$dir_name/$short_path' at $timestamp" >> "$log_file"
  else
    # --- Log deletion to console and file
    echo -e "${RED}[DELETED]${NC} '$dir_name/$short_path' at $timestamp"
    echo -e "[DELETED] '$dir_name/$short_path' at $timestamp" >> "$log_file"
  fi
done



