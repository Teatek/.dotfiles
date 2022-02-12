" gitsigns
lua << EOF
require('gitsigns').setup()
EOF

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
