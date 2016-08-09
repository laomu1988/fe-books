git add .
git commit -m 'add-to-update'
rm -rf _books
rm -rf books/server
mv books _books
cp index.html _books/index.html
cp -r server _books/server
cp server.js _books/server.js
cp package.json _books/package.json
git checkout gh-pages
mv -f _books/index.html index.html
mv -f _books/server.js server.js
rm -rf server
mv -f _books/server server
rm -rf books
mv _books books
git add .
git commit -m "update"
mv books _books
git checkout master
mv _books books
echo 'push to gh-pages success...';