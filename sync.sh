git pull;

cp ~/.zshrc ./zsh/;

cp ~/.vimrc ./vim/;
cp ~/.config/nvim/init.vim ./vim;

cp ~/.tmux.conf ./tmux/;

cp ~/tmux-256color.terminfo ./shell;
cp ~/xterm-256color-italic.terminfo ./shell;

cp ~/bin/getBatteryStats.sh ./bin;
cp ~/bin/getCpuUsage.sh ./bin;
cp ~/bin/getMemUsage.sh ./bin;
cp ~/bin/spotify.sh ./bin;

cp ~/applescript/spotify.scpt ./applescript;

git commit -am "$@";
git push;
