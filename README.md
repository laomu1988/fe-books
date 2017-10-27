**前端资料整理fe-book**
======
* 访问地址: [http://laomu1988.github.io/fe-books/](http://laomu1988.github.io/fe-books/)
* 源码地址: [https://github.com/laomu1988/fe-books](https://github.com/laomu1988/fe-books)

    整理部分网站资料，备份并放在github中浏览，在原网站访问不了或者速度太慢时作为备用。 此地只是这些资源的一个镜像，无原内容版权，请支持原网站。
    你可以将项目放在下载到本地浏览，响应速度更快
    目前搜索仅支持英文

# 前端文档合集
* [devdocs.io](http://devdocs.io)

# 整合项目及引入地址

* [vue-router](https://github.com/vuejs/vue-router/)
* [koa2](https://github.com/chenshenhai/koa2-note.git)
* [vuex](https://github.com/vuejs/vuex.git)
* [egg](https://github.com/eggjs/egg.git)

# Todo
### 待整合
* jquery
* express

### 待处理
* 中文搜索
* 左侧目录可收缩和展开
* gitbook目录重复使用
* gitbook和hexo两种格式的兼容处理，在不修改原有项目的情况下进行打包
* 顶级菜单改为使用js引入

### 工具话
* 集成到electron
* 配置git地址

## mark
* 增加git子模块示例：git submodule add https://github.com/vuejs/vuex.git github/vuex
* 将github/vuex中对应文档拷贝到文档中
* 使用github命令编译文件到books中

## 文件夹组织结构
- _layout gitbook模板文件
- github git上的源码
- source 要用到的原文档，每次编译时将会被删除
- docs 自己添加的文档，编译前会被复制到source对应目录下

# history
* 2017.10.27 增加egg
* 2017.10.26 增加Vuex
* 2017.04.14 增加vue-router2和koa2-note学习笔记
* 2017.02.08 hexo打包内容修改： 根目录修改
* 2017.02.07 vue2子模块
* 2016.08.10 vue的api和代码执行问题
* 2016.08.09 菜单中增加页面目录
* 2016.08.02 增加nodejs
* 2016.07.06 tools中增加git速查
* 2016.06.22 增加koa
* 2016.06.20 增加react文档
* 2016.06.14 增加fis3文档；增加vue和vue-router


# 参考链接
* [gitbook实用配置及插件列表](http://blog.csdn.net/zhangjk1993/article/details/50380403)
