Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }'
let g:mkdp_auto_close = 1
let g:mkdp_auto_start = 1
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'dark'

nnoremap <M-m> :MarkdownPreview<CR>
