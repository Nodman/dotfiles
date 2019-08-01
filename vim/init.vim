set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
"this fixes nerdtree partial highlight in neovim
hi NERDTreeFile guibg=none
