git add .
git commit -m 'add-to-update'
rm -rf _books
mv books _books
git checkout gh-pages
rm -rf books
mv _books books
git add .
git commit -m "update"
mv books _books
git checkout master
mv _books books
echo 'push to gh-pages success...';