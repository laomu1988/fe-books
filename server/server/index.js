(function () {
    document.addEventListener('DOMContentLoaded', function () {
        // 创建目录
        gitbook.events.on('page.change', function () {
            var hs = document.querySelector('.page-wrapper').querySelectorAll('h1[id],h2[id],h3[id],h4[id]');
            var str = '';
            for (var i = 0; i < hs.length; i++) {
                var h = hs[i];
                str += '<li><a href="#' + h.id + '" class="' + h.nodeName.toLowerCase() + '">' + h.textContent + '</a></li>'
            }
            if (str) {
                $('.menu-last').html('<a href="javascript:void(0)">页面目录</a><ul class="sub">' + str + '</ul>');
            } else {
                $('.menu-last').html('');
            }
        });
    }, false);
})();
