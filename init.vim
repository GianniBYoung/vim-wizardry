lua require('plugins')
lua require('genset')
lua require('keymaps')
lua require('autocmd')

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')
" can definitly port which-key to lua
" same with viki
source ~/.config/nvim/plugins/which-key.vim
source ~/.config/nvim/plugins/vimwiki.vim
source ~/.config/nvim/plugins/fzf.vim

doautocmd User PlugLoaded
" Misc
autocmd BufWritePost *default.yml !espanso restart
autocmd FileWritePost *zshrc !source ~/.zshrc
au BufWritePost *.go !gofmt -w %
