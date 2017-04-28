// 使用js生成菜单避免每次增加项目都要全部重新打包
(function() {
    var HTML = '';
    var menus = [
        {
            name: 'assist',
            menus: []
        },
        {
            name: 'react',
            menus: []
        },
        {
            name: 'vue',
            menus: [
                {name: 'vue2'},
                {name: 'vue-router'},
                {name: 'vue-router2'},
            ]
        },
        {
            name: 'node',
            menus: [
                {name: 'koa'},
                {name: 'koa2学习笔记',link: '/fe-books/koa2-note/'},
            ]
        },
        {
            name: 'es6入门',
            link: '/fe-books/es6/',
            menus: []
        },
        {
            name: 'tools',
            menus: [
                {name: 'git', 'link': '/fe-books/tools/git.html'},
                {name: 'vim', 'link': '/fe-books/tools/vim.html'},
                {name: 'fis3', 'link': '/fe-books/fis3/index.html'},
            ]
        }
    ]
    function createHTML(menu) {
        var html = '<li><a href="'+(menu.link || ('/fe-books/' + menu.name + '/'))+'">'+menu.name+'</a>';
        if(menu.menus && menu.menus.length > 0) {
            html += '<ul class="sub">' +  menu.menus.map(createHTML).join('') + '</ul>';
        }
        html += '</li>';
        return html;
    }
     HTML = '<nav class="fe-menu"><ul>' + menus.map(createHTML).join('') + '<li class="menu-last"></li></ul></nav>';

    var match = location.pathname.match(/fe-books\/(\w+)/);
    var module = match[1];
    switch(module){
        case 'vue':
            HTML += '<script src="/fe-books/server/vue.min.js"></script>';
            break;
    }

    document.write(HTML);
})();
