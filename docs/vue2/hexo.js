/**
 * hexo打包项目
 * 参考内容：
 *   - [hexoapi](https://github.com/hexojs/site/blob/master/source/api/index.md)
 *   - [render.md](https://github.com/hexojs/site/blob/master/source/api/rendering.md)
 */
var Hexo = require('hexo');
var hexo = new Hexo(process.cwd(), {});
var folder = process.argv[2] || 'vue2';
hexo.extend.filter.register('after_render:html', function(str, data) {
    str = str.replace(/(href|src)(=['"]\/)(\w+)/g, function(all, pre, plus, word) {
        if (word === 'fe') {
            return all;
        } else {
            return pre + plus + 'fe-books/' + folder
        }
        if (folder === 'vue2') {

        }
        return all;
    });
    sign++;
    return str;
});
hexo.init().then(function() {
    hexo.call('generate', {}).then(function() {
        return hexo.exit();
    }).catch(function(err) {
        console.log('err');
        return hexo.exit(err);
    });
});
