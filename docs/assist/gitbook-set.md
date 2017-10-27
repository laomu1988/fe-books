# gitbook配置
本文选自: http://www.cnblogs.com/zhangjk1993/p/5066771.html?utm_source=tuicool&utm_medium=referral
在项目根目录中配置book.json

* **title** 设置书本的标题
```
"title" : "Gitbook Use"
```
* **author** 作者的相关信息
```
"author" : "zhangjikai"
```
* **description** 本书的简单描述
```
"description" : "记录Gitbook的配置和一些插件的使用"
```
* **language** Gitbook使用的语言, 版本2.6.4中可选的语言如下：
en, ar, bn, cs, de, en, es, fa, fi, fr, he, it, ja, ko, no, pl, pt, ro, ru, sv, uk, vi, zh-hans, zh-tw

配置使用简体中文:
```
"language" : "zh-hans",
```
* **links** 在左侧导航栏添加链接信息
```
"links" : {
    "sidebar" : {
        "Home" : "http://zhangjikai.com"
    }
}
```
* **styles** 自定义页面样式， 默认情况下各generator对应的css文件
```
"styles": {
    "website": "styles/website.css",
    "ebook": "styles/ebook.css",
    "pdf": "styles/pdf.css",
    "mobi": "styles/mobi.css",
    "epub": "styles/epub.css"
}
```
例如使 \<h1\> \<h2\> 标签有下边框， 可以在 website.css 中设置
```
h1 , h2{
    border-bottom: 1px solid #EFEAEA;
}
```
* **plugins** 配置使用的插件
```
"plugins": [
    "disqus"
]
```
添加新插件之间需要运行 gitbook install 来安装新的插件

Gitbook默认带有5个插件：

highlight
search
sharing
font-settings
livereload
如果要去除自带的插件， 可以在插件名称前面加 -
```
"plugins": [
    "-search"
]
```

* **pluginsConfig** 配置插件的属性
```
"pluginsConfig": {
    "fontsettings": {
        "theme": "sepia",
        "family": "serif",
        "size":  1
    }
}
```

## 记录一些实用的插件

* **Disqus** 添加disqus评论
```
"plugins": [
    "disqus"
],
"pluginsConfig": {
    "disqus": {
        "shortName": "gitbookuse"
    }
}
```

* **Search Pro** 支持中文搜索, 需要将默认的search插件去掉, 注意: 如果标题中有包含的关键字, 标题的样式会有所变化
```
"plugins": [
    "-search",
    "search-pro"
],
"pluginsConfig": {
    "search-pro": {
        "cutWordLib": "nodejieba",
        "defineWord" : ["Gitbook Use"]
    }
}
```
* **Advanced Emoji** 支持emoji表情
```
"plugins": [
    "advanced-emoji"
]
```
* **Github**  添加github图标
```
"plugins": [ 
    "github" 
],
"pluginsConfig": {
    "github": {
        "url": "https://github.com/zhangjikai"
    }
}
```

* **Ace Plugin** 使gitbook支持ace
```
"plugins": [
    "ace"
]
```
* **Emphasize** 为文字加上底色
```
"plugins": [
    "emphasize"
]
```

* **KaTex** 为了支持数学公式, 我们可以使用 KaTex 和 MathJax 插件, 官网上说 Katex 速度要快于 MathJax 
```
"plugins": [
    "katex"
]
```

* **Include Codeblock** 使用代码块的格式显示所包含文件的内容. 该文件必须存在.
```
"plugins": [
    "include-codeblock"
]
```

* **Splitter** 使侧边栏的宽度可以自由调节
```
"plugins": [
    "splitter"
]
```
* **Mermaid** 支持渲染 Mermaid 图表
```
"plugins": [
    "mermaid"
]
```

* **Sharing** 分享当前页面

gitbook的默认插件, 使用下面方式来禁用
```
 plugins: ["-sharing"]
```
配置
```
"pluginsConfig": {
    "sharing": {
        "weibo": true,
        "facebook": true,
        "twitter": true,
        "google": false,
        "instapaper": false,
        "vk": false,
        "all": [
            "facebook", "google", "twitter",
                "weibo", "instapaper"
        ]
    }
}
```
* **Tbfed-pagefooter**为页面添加页脚
```
"plugins": [
   "tbfed-pagefooter"
],
"pluginsConfig": {
    "tbfed-pagefooter": {
        "copyright":"Copyright © zhangjikai.com 2015",
        "modify_label": "该文件修订时间：",
        "modify_format": "YYYY-MM-DD HH:mm:ss"
    }
}
```

* **Toggle Chapters** 是左侧的章节目录可以折叠
```
"plugins": ["toggle-chapters"]
```

* **Sectionx** 将页面分块显示
```
"plugins": [
   "sectionx"
]
```

* **Codeblock-filename** 为代码块添加文件名称
```
plugins: [ "codeblock-filename" ] 
```

* **ga** google 统计
```
"plugins": [
    "ga"
 ],
"pluginsConfig": {
    "ga": {
        "token": "UA-XXXX-Y"
    }
}
```
* **baidu** 百度统计
```
"plugin": [
    "baidu"
 ],
"pluginsConfig": {
    "baidu": {
        "token": "YOUR TOKEN"
    }
}
```