#!/bin/bash
sourcedir=$1
pluginpath="/opt/electriccloud/electriccommander/plugins/"
direxist=`ls -ltr | awk '{print $9}' | grep $sourcedir`
if [ "$direxist" = "" ]
then
  echo "can't find the directory!!"
  exit 1
fi

if [ ! -d $pluginpath ]
then
  echo "can't find the plugin directory,please check it"
  exit 1
fi

cgidir=`echo "./$sourcedir/cgi-bin"`
if [ ! -d $cgidir ]
then
  echo "can't find the path $cgibin !!!"
  exit 1
fi

pluginexit=`ls $pluginpath | grep -w $sourcedir`
if [ "$pluginexit" != "" ]
then
  cd $pluginpath
  sudo rm -rf $sourcedir
  cd -
fi

sudo mv $sourcedir $pluginpath
cd $pluginpath
sudo chown -R ecsync:ecsyncgrp $sourcedir
cd $sourcedir
cd ./cgi-bin
sudo chmod 0755 *
sudo dos2unix *