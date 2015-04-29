#!/bin/bash

#script to make back-up copies of files in current directory

TIME=`date+"%F"`
CURDIR=`pwd`
ORIGFILES=`ls`
UNWANTED='bak'
BACKUPFILE="backup-$TIME.tar.bz2"
DESDIR="/home/cyang/bakk"

echo "Getting ready to backup $CURDIR"

if [[ $ORIGFILES == *"bak"* ]] 
then
    echo "Already bakked - what now?"; exit
else
    for f in $ORIGFILES
    do
        cp $f $f.bak
    done
fi

echo "Zipping up the files"
tar -cpzf $DESDIR/$BACKUPFILE ./*.bak
echo "Removing temp .bak files"
rm *.bak
echo "done"

exit 0
