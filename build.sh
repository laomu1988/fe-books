#!/bin/bash

folders=("assist" "es6" "fis3" "koa" "node" "react" "tools" "vue" "vue-router" "vue-router2" "koa2-note" "vuex")
output='books'

if [ "$1"V = "V" ]
then
    echo 'build'
    cd $output
    git checkout gh-pages
    rm -rf server
    cd ../
    rm -rf assist/README.md
    cp README.md assist/README.md
    cp -r server $output/server

    # build vue2
    echo 'build vue2'
    cd vue2
    node ../hexo.js vue2
    cp -r public ../$output/vue2
    cd ..


    # 更新子模块
    git submodule foreach git pull
    # git  submodule add https://github.com/vuejs/vue-router.git github/vue-router

    # build vue-router
    echo 'build vue-router and vue-router2'
    rm -r vue-router
    rm -r vue-router2
    rm -r koa2-note
    rm -r vuex
    cd github/vue-router
    git reset --hard
    git checkout 1.0
    cp -r docs/zh-cn ../../vue-router
    git checkout dev
    cp -r docs/zh-cn ../../vue-router2
    cd ../../
    cp -r github/koa2-note koa2-note
    rm -r koa2-note/.git
    rm -r koa2-note/.gitignore

    cp -r github/vuex/docs/zh-cn vuex

    ## 循环编译指定文件夹
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
