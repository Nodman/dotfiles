git pull;

cp ~/.zshrc ./zsh/;

cp -r ~/.config/nvim/ ./vim;

cp ~/.tmux.conf ./tmux/;

cp ~/tmux-256color.terminfo ./shell;
cp ~/xterm-256color-italic.terminfo ./shell;
cp ~/info.sh ./shell;

cp ~/applescript/spotify.scpt ./applescript;

git commit -am "$@";
git push;
