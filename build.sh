#!/bin/bash
###################################
# 编译打包步骤
# 1. 更新git源码
# 2. 拷贝git源码中文档部分到source目录
# 3. 拷贝docs文档中内容到source目录
# 4. 拷贝book.json和_layouts到编译目录
# 5. 使用gitbook或者指定脚本编译到books目录
# 6. 将修改提交到github
###################################

output='books' # gitbook编译后输出目录
source='source' # gitbook编译使用的源码所在目录

# 所有的模块总列表
all=(
    "assist"
    # "egg"
    "es6"
    "fis3"
    "koa"
    "node"
    "react"
    "tools"
    "vue"
    "vue2"
    "vue-router"
    "vue-router2"
    "koa2-note"
    "vuex"
)

## 使用gitbook打包的模块列表
folders=(
    "assist"
    "es6"
    "egg"
    "fis3"
    "koa"
    "node"
    "react"
    "tools"
    "vue"
    "vue-router"
    "vue-router2"
    "koa2-note"
    "vuex"
)

## 使用hexo打包的模块列表
hexo=(
    "vue2"
)

if [ "$1"V = "V" ]
then
    # 未指定打包具体模块

    ## 更新gh-pages
    echo 'build'
    cd $output
    git checkout gh-pages
    git reset --hard
    rm -rf server
    cd ../
    
    cp -rf index.html $output/index.html
    cp -rf server $output/server
    cp -rf server.js $output/server.js
    cp -rf package.json $output/package.json
    rm -rf assist/README.md

    # 更新子模块
    git submodule foreach git pull
    # git  submodule add https://github.com/vuejs/vue-router.git github/vue-router

    # remove folder
    rm -rf $source/vue-router
    rm -rf $source/vue-router2
    rm -rf $source/koa2-note
    rm -rf $source/vuex

    ## 循环编译指定文件夹
    for folder in "${all[@]}"
    do
        sh build.sh "$folder"
    done
else
    rm -rf $source/$1
    mkdir $source/$1
    echo "build $1"
    if [ "$1" = "assist" ]; then
        cp README.md $source/assist/README.md
    elif [ "$1" = "vue2" ]; then
        cd docs/vue2
        node ../../hexo.js docs/vue2
        cp -r public ../../$output/vue2
        cd ../../
    elif [ "$1" = "vue-router" ]; then
        cd github/vue-router
        git reset --hard
        git checkout 1.0
        cp -r docs/zh-cn ../../$source/vue-router
        cd ../../
    elif [ "$1" = "vue-router2" ]; then
        cd github/vue-router
        git reset --hard
        git checkout dev
        cp -r docs/zh-cn ../../$source/vue-router2
        cd ../../
    elif [ "$1" = "koa2-note" ]; then
        cp -r github/koa2-note $source/koa2-note
        rm -r $source/koa2-note/.git
        rm -r $source/koa2-note/.gitignore
    elif [ "$1" = "egg" ]; then
        cp -r github/egg/docs/source/zh-cn $source/egg
    elif [ "$1" = "vuex" ]; then
        cp -r github/vuex/docs/zh-cn $source/vuex
    else
        echo ' ---'
    fi

    # 判断是否使用hexo打包
    if echo "${hexo[@]}" | grep -w "$1" &>/dev/null; then
        echo "todo: hexo build github/$1 $output/$1"
    fi

    # 判断是否使用gitbook打包
    if echo "${folders[@]}" | grep -w "$1" &>/dev/null; then
        echo "gitbook build $source/$1 $output/$1"
        mkdir -p $source/$1
        # 替换gitbook原文件
        rm -rf $source/$1/book.json
        rm -rf $source/$1/_layouts
        cp book.json $source/$1/book.json
        cp -rf _layouts/ $source/$1/_layouts/
        cp -rf docs/$1/ $source/$1/

        gitbook build $source/$1 "$output/$1"

        rm -rf $source/$1/book.json
        rm -rf $source/$1/_layouts
    fi
fi
