#!/bin/bash
folders=("assist" "es6" "fis3" "koa" "node" "react" "tools" "vue" "vue-router")
output='books'

if [ "$1"V = "V" ]
then
    for folder in "${folders[@]}"
    do
        echo "git book build $folder $output/$folder"
        gitbook build $folder "$output/$folder"
    done
else
    echo "git book build $1 $output/$1"
    gitbook build $1 "$output/$1"
fi