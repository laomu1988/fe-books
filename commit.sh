rm _books
sh build.sh
mv books _books
git checkout gh-pages
rm books
mv _books books
git add ./
git commit -m "update"
git push
mv books _books
git checkout master
mv _books books
echo 'push to gh-pages success...';