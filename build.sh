#!/bin/bash
folders=("assist" "es6" "fis3" "koa" "node" "react" "tools" "vue" "vue-router")
output='books'

if [ "$1"V = "V" ]
then
    rm -rf README.md
    cp assist/README.md README.md
    for folder in "${folders[@]}"
    do
        sh build.sh "$folder"
    done
else
    echo "gitbook build $1 $output/$1"
    rm -rf $1/book.json
    rm -rf $1/_layouts
    cp book.json $1/book.json
    cp -r _layouts/ $1/_layouts/

    gitbook build $1 "$output/$1"

    rm -rf $1/book.json
    rm -rf $1/_layouts
fi