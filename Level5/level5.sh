#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

mkdir -p Battlefield
touch Battlefield/knight.txt Battlefield/rogue.txt Battlefield/captain.txt
if [ -f Battlefield/knight.txt ]; then
	mkdir -p Newhome
	mv Battlefield/knight.txt Newhome
else
	echo -e "${RED}This file does not exist in Battlefield directory${NC}"
fi

echo -e "${GREEN}Contents of Battlefield${NC}"
ls Battlefield

echo -e "${GREEN}Contents of Newhome${NC}"
ls Newhome