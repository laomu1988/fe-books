(function () {
    // 使用js生成菜单避免每次增加项目都要全部重新打包
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
            menus: []
        },
        {
            name: 'node',
            menus: [
                {name: 'koa'}
                {name: 'koa2学习笔记',link: '/fe-books/koa2-note/'}
            ]
        },
        {
            name: 'es6',
            title: 'es6入门',
            menus: []
        },
        {
            name: 'tool',
            menus: [
                {name: 'git', 'link': '/fe-books/tools/git.html'}
                {name: 'vim', 'link': '/fe-books/tools/vim.html'}
                {name: 'fis3', 'link': '/fe-books/fis3/index.html'}
            ]
        }
    ]
    function createHTML(menu) {
        var html = '<li><a href="'+(menu.link || ('/fe-books/' + menu.name))+'">'+menu.name+'</a>';
        if(menu.menus && menu.menus.length > 0) {
            html = '<ul>' +  menu.menus.map(createHTML).join('') + '</ul>';
        }
        html += '</li>';
        return html;
    }
    document.write('<ul>' + menus.map(createHTML).join('') + '</ul>')

    // 创建目录
    document.addEventListener('DOMContentLoaded', function () {
        gitbook.events.on('page.change', function () {
            var hs = document.querySelector('.page-wrapper').querySelectorAll('h1[id],h2[id],h3[id],h4[id]');
            var str = '';
            for (var i = 0; i < hs.length; i++) {
                var h = hs[i];
                str += '<li><a href="#' + h.id + '" class="' + h.nodeName.toLowerCase() + '">' + h.textContent + '</a></li>'
            }
            if (str) {
                $('.menu-last').html('<a href="javascript:void(0)">目录</a><ul class="sub">' + str + '</ul>');
            } else {
                $('.menu-last').html('');
            }
        });
    }, false);
})();
