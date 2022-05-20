" set light or dark to change global theme (also affects statusline) (need to restart vim everytime it needs to be changed)
set background=dark
" set background=light
let g:onedark_config = {
  \ 'transparent': v:false,
  \ 'style': 'cool',
  \ 'toggle_style_key': '<leader>ts',
  \ 'toggle_style_list' : [ 
    \ 'light',
    \ 'cool',
  \ ], 
\}
" list toggle dark, darker, deep, warm, warmer 
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }
set t_Co=256
colorscheme onedark
syntax on

if g:onedark_config['style'] == 'light'
  " gui
  highlight LineNr guifg=Black
  highlight LineNrAbove guifg=Grey
  highlight LineNrBelow guifg=Grey
  " terminal
  highlight LineNr ctermfg=Black
  highlight LineNrAbove ctermfg=Grey
  highlight LineNrBelow ctermfg=Grey 
else
  highlight LineNr guifg=White
  highlight LineNrAbove guifg=Grey
  highlight LineNrBelow guifg=Grey 

  highlight LineNr ctermfg=White
  highlight LineNrAbove ctermfg=Grey
  highlight LineNrBelow ctermfg=Grey 
endif
