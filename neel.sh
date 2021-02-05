#!/bin/bash
echo "                                                     "
echo "             _     _                     _       _   "
echo "  _ __  _ __(_)___| |__    ___  ___ _ __(_)_ __ | |_ "
echo " | '_ \| '__| / __| '_ \  / __|/ __| '__| | '_ \| __|"
echo " | |_) | |  | \__ \ | | | \__ \ (__| |  | | |_) | |_ "
echo " | .__/|_|  |_|___/_| |_| |___/\___|_|  |_| .__/ \__|"
echo " |_|                                      |_|        "
echo "                                                     "
echo "        coded by Neel0210, DAvinash97, yukosky       "
echo "                                                     "
echo "Select"
echo "1 = Clear"
echo "2 = Extract super.img"
echo "3 = Pack super.img"
echo "4 = Exit"
read input

case $input in
1)
  echo "============="
  echo "Clearing ALL"
  echo "============="
  rm *.img
  #rm *.img-old
  ;;

2)
  echo "==================="
  echo "Unpack super image"
  echo "==================="
  ./imjtool super.img extract ./PRISH
  mv super.img ./PRISH/super.img-old ; mv extracted/* .
  ;;

3)
  echo "================="
  echo "pack super image"
  echo "================="
  chmod a+x lpmake
  ./lpmake --metadata-size 65536 --super-name super --metadata-slots 2 --device super:6539968512 --group main:4187590970 --partition system:readonly:2330120192:main --image system=./system.img --partition vendor:readonly:646946816:main --image vendor=./vendor.img --partition odm:readonly:4349952:main --image odm=./odm.img --sparse --output ./super.img
  ;;

4)
  echo "======"
  echo "exit"
  echo "======"
  ./lpunpack --partition=odm super.img .
  #exit
  ;;

*)
  echo "invalid input!\nexitting..."
  exit 1
  ;;

esac
