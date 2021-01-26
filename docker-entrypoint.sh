#!/bin/bash


if [ -e "/leanote-linux-amd64.bin.tar.gz" ]; then
    cd /
    tar -zxf leanote-linux-amd64.bin.tar.gz
    chmod a+x leanote/bin/run.sh
    rm -f leanote-linux-amd64.bin.tar.gz
    rm -rf leanote/mongodb_backup
fi

echo `date "+%Y-%m-%d %H:%M:%S"`' >>>>>> start leanote service'
cd /leanote/bin
./run.sh