#!/bin/bash
origdir=$(pwd)
RED='\033[0;32m'
NC='\033[0m'

echo "\n${RED}MINERVA${NC}"
echo "\n"
cd $MINERVADIR
git status
echo "\n"
read -p "Do you wish to checkout to new branch in minerva? (Y/n)  " yn
case $yn in
      [Yy]* ) bash $SCRIPTSDIR/fbr.sh; break;;
      [Nn]* ) break;;
      * )
        if [ "$yn" ]
          then
            echo "Please answer yes or no."
          else
            echo "\n"
            bash $SCRIPTSDIR/fbr.sh
        break
        fi
        ;;
esac
echo "\n"

echo "\n${RED}MINERVA-CONFIG${NC}"
echo "\n"
cd /home/m88614/projects/Minerva/minerva-config/
git status
echo "\n"
read -p "Do you wish to checkout to new branch in minerva-config? (Y/n)  " yn
case $yn in
      [Yy]* ) bash $SCRIPTSDIR/fbr.sh; break;;
      [Nn]* ) exit;;
      * )
        if [ "$yn" ]
          then
            echo "Please answer yes or no."
          else
            bash $SCRIPTSDIR/fbr.sh
        break
        fi
        ;;
esac
cd $origdir
