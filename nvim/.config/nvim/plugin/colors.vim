let g:onedark_config = {
  \ 'transparent': v:false,
  \ 'style': 'cool',
\}
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
" terminal
highlight LineNr guifg=White
highlight LineNrAbove guifg=Grey
highlight LineNrBelow guifg=Grey 
" gui
highlight LineNr guifg=White
highlight LineNrAbove guifg=Grey
highlight LineNrBelow guifg=Grey 

