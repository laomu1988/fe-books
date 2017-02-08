#!/bin/bash
folders=("assist" "es6" "fis3" "koa" "node" "react" "tools" "vue" "vue-router")
output='books'

if [ "$1"V = "V" ]
then
    echo 'build'
    cd $output
    git checkout gh-pages
    cd ../
    rm -rf assist/README.md
    cp README.md assist/README.md

    # build vue2
    echo 'build vue2'
    cd vue2
    node ../hexo.js vue2
    cp -r public ../$output/vue2
    cd ..


    for folder in "${folders[@]}"
    do
        sh build.sh "$folder"
    done

    cp -r index.html $output/index.html
    cp -r server $output/server
    cp -r server.js $output/server.js
    cp -r package.json $output/package.json
    rm -rf assist/README.md

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
