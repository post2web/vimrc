rm -f .vimrc
cp  ~/.vimrc .
rm -fr .vim
cp -r ~/.vim .
rm -fr .config
mkdir .config
cp -r ~/.config/nvim .config/
git add -A
git commit -m 'update'
git push
