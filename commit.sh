git add .
git commit -m 'add-to-update'
rm -rf _books
mv books _books
cp index.html _books/index.html
cp -f server _books/server
cp package.json _books/package.json
git checkout gh-pages
mv -f _books/index.html index.html
mv -f _books/server.js server.js
mv -f _book/server server
rm -rf books
mv _books books
git add .
git commit -m "update"
mv books _books
git checkout master
mv _books books
echo 'push to gh-pages success...';