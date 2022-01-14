let g:onedark_transparent_background = v:true
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
colorscheme onedark
syntax on
" terminal
highlight LineNr guifg=Black guibg=Grey gui=bold
highlight LineNrAbove guifg=Grey
highlight LineNrBelow guifg=Grey 
" gui
highlight LineNr guifg=Black guibg=Grey gui=bold
highlight LineNrAbove guifg=Grey
highlight LineNrBelow guifg=Grey 

