#!/bin/bash
origdir=$(pwd)
RED='\033[0;32m'
NC='\033[0m'


echo "\n${RED}MINERVA${NC}"
echo "\n"
cd $MINERVADIR
git status
echo "\n"
read -p "Do you wish to checkout develop in minerva? (Y/n)  " yn
case $yn in
      [Yy]* ) git checkout develop; break;;
      [Nn]* ) break;;
      * )
        if [ "$yn" ]
          then
            echo "Input not supported, going to next repo"
          else
            git checkout develop
            break
        fi
        ;;
esac
echo "\n######################################################################"
echo "\n"

echo "\n${RED}MINERVA-CONFIG${NC}"
cd $MINERVACONFDIR
echo "\n"
git status
echo "\n"
read -p "Do you wish to checkout develop in minerva-config? (Y/n)  " yn
case $yn in
      [Yy]* ) git checkout develop; break;;
      [Nn]* ) exit;;
      * )
        if [ "$yn" ]
          then
            echo "Please answer yes or no."
          else
            git checkout develop
        break
        fi
        ;;
esac
cd $origdir
