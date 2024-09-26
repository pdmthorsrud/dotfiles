#!/bin/bash
RED='\033[0;32m'
NC='\033[0m'

tmpdir=$(pwd)

echo "\n${RED}MINERVA${NC}"
cd $MINERVADIR
git status

echo "\n${RED}MINERVA-CONFIG${NC}"
cd $MINERVACONFDIR
git status

cd $tmpdir