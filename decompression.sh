#!/bin/bash
filelist=`ls ./`
save_old_dir="old/"
mkdir $save_old_dir
for file in $filelist; do
    echo "decompress $file"
    suffix=${file:0-3:3}
    if [ "$suffix" == "rar" ]; then
        len=`expr length "$file"`
        dir=${file:0:len-4}
        mkdir $dir
        echo "unrar x $file $dir"
        unrar x $file $dir
        mv $file $save_old_dir
    fi
    if [ "$suffix" == "zip" ]; then
        len=`expr length "$file"`
        dir=${file:0:len-4}
        mkdir $dir
        echo "unzip $file -d $dir"
        unzip $file -d $dir
        mv $file $save_old_dir
    fi
done

