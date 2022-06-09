" Based off of Jess Archer's configs
"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
" set listchars=tab:▸\ ,trail:·
lua require('plugins')
" ~/.config/nvim/lua/plugins.lua
" ~/.config/nvim/lua/genset.lua
" ~/.config/nvim/lua/keymaps.lua
lua require('genset')
lua require('keymaps')

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
" noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
" noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

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
source ~/.config/nvim/plugins/textobj-xmlattr.vim
source ~/.config/nvim/plugins/which-key.vim
source ~/.config/nvim/plugins/vimwiki.vim
source ~/.config/nvim/plugins/smooth-scroll.vim
source ~/.config/nvim/plugins/fzf.vim
" source ~/.config/nvim/plugins/airline.vim

" " source ~/.config/nvim/plugins/firenvim.vim
" Plug 'neovim/nvim-lspconfig'
" source ~/.config/nvim/plugins/commentary.vim
" source ~/.config/nvim/plugins/context-commentstring.vim
" source ~/.config/nvim/plugins/dracula.vim
" source ~/.config/nvim/plugins/eunuch.vim
" source ~/.config/nvim/plugins/exchange.vim
" source ~/.config/nvim/plugins/floaterm.vim
" source ~/.config/nvim/plugins/heritage.vim
" source ~/.config/nvim/plugins/pasta.vim
" source ~/.config/nvim/plugins/peekaboo.vim
" source ~/.config/nvim/plugins/polyglot.vim
" source ~/.config/nvim/plugins/quickscope.vim
" source ~/.config/nvim/plugins/sayonara.vim
" source ~/.config/nvim/plugins/surround.vim
" source ~/.config/nvim/plugins/targets.vim

" source ~/.config/nvim/plugins/lspconfig.vim
" source ~/.config/nvim/plugins/cmp-nvim-lsp.vim
" source ~/.config/nvim/plugins/lspkind-nvim.vim
" source ~/.config/nvim/plugins/cmp-buffer.vim
" source ~/.config/nvim/plugins/nvim-cmp.vim
" source ~/.config/nvim/plugins/nvim-colorizer.lua.vim
" source ~/.config/nvim/plugins/vim-rainbow.vim
" source ~/.config/nvim/plugins/auto-pairs.vim
" source ~/.config/nvim/plugins/vim-highlightedyank.vim
" source ~/.config/nvim/plugins/vim-sneak.vim
" source ~/.config/nvim/plugins/markdown-preview.vim
" source ~/.config/nvim/plugins/vim-go.vim
call plug#end()

doautocmd User PlugLoaded
" Misc
autocmd BufWritePost *default.yml !espanso restart
autocmd FileWritePost *zshrc !source ~/.zshrc
au BufWritePost *.go !gofmt -w %

