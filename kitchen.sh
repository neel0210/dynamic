#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NOCOL='\033[0m'
LOGO="${BLUE}             _     _                     _       _   \n  _ __  _ __(_)___| |__    ___  ___ _ __(_)_ __ | |_ \n | '_ \| '__| / __| '_ \  / __|/ __| '__| | '_ \| __|\n | |_) | |  | \__ \ | | | \__ \ (__| |  | | |_) | |_ \n | .__/|_|  |_|___/_| |_| |___/\___|_|  |_| .__/ \__|\n |_|                                      |_|        \n
to Unpack/Repack Super.img\n
coded by Neel0210, DAvinash97, yukosky${NOCOL}"
clear
echo -e "$LOGO"
if [ ! -f imjtool ] | [ ! -f imjtool ] | [ ! -f imjtool ]; then
echo -e "\n${RED}Make Sure You Clone/Download the Script Properly, Some Files are missing\n"
echo -e "Exiting...\n${NOCOL}"
sleep 5
exit
fi

LIST="Clear UnPack Repack Exit"
SELECT="\n${YELLOW}1) Clear
2) Unpack
3) Repack
4) Exit${NOCOL}"
select OPTION in $LIST
do
case $OPTION in
Clear)
  echo "============"
  echo "Clearing ALL"
  echo "============"
  rm *.img
  #rm *.img-old
  clear
  echo -e "$LOGO"
  echo -e "$SELECT"
  ;;

UnPack)
  echo "====================="
  echo "Unpacking Super Image"
  echo "====================="
  ./imjtool super.img extract ./PRISH
  mv super.img ./PRISH/super.img-old ; mv extracted/* .
 clear
 echo -e "$LOGO"
 echo -e "$SELECT"
  ;;

Repack)
  echo "====================="
  echo "Repacking Super Image"
  echo "====================="
  chmod a+x lpmake
  ./lpmake --metadata-size 65536 --super-name super --metadata-slots 2 --device super:6539968512 --group main:4187590970 --partition system:readonly:2330120192:main --image system=./system.img --partition vendor:readonly:646946816:main --image vendor=./vendor.img --partition odm:readonly:4349952:main --image odm=./odm.img --sparse --output ./super.img
  clear
  echo -e "$LOGO"
  echo -e "$SELECT"
  ;;

Exit)
  echo "===="
  echo "exit"
  echo "===="
  ./lpunpack --partition=odm super.img .
  break
  ;;
*)
  echo -e "\nError: Invalid Input\n"
  clear
  echo -e "$LOGO"
  echo -e "$SELECT"
  ;;
esac
done
