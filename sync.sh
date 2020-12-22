git pull;

cp ~/.zshrc ./zsh/

rm -rf ./nvim
cp -r ~/.config/nvim ./
rm -rf ./nvim/plugged

rm -rf ./kitty
cp -r ~/.config/kitty ./

rm -rf ./hammerspoon
cp -r ~/.hammerspoon ./

cp ~/.tmux.conf ./tmux/

cp -r ~/bin ./

cp ~/tmux-256color.terminfo ./shell;
cp ~/xterm-256color-italic.terminfo ./shell

cp ~/applescript/spotify.scpt ./applescript

git add .
git commit -am "sync $@"
git push
