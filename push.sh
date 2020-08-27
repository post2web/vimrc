rm -f .vimrc
cp  ~/.vimrc .
rm -fr .vim
cp -r ~/.vim .
git add -A
git commit -m 'update'
git push
