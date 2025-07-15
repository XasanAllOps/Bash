#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

move_file (){
	local file_name=$1
	local send_to_dir=$2

	if [[ -f $file_name ]]; then
		mkdir -p "$send_to_dir"
		mv "$file_name" "$send_to_dir/"
		echo -e "${GREEN}You have sucessfully moved${NC} '$file_name' ${GREEN}to${NC} '$send_to_dir'"

	else
		echo -e "${RED}Error: Filename '$file_name' does not exist!${NC}"
		return 1
	fi
}
move_file "$1" "$2"