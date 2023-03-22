" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont! Jetbrains Mono Medium:h9
    " GuiFont! Consolas:h9
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif
"
" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

" treeview
nnoremap <leader>pv :GuiTreeviewToggle<CR>

nnoremap <C--> <C-^>

" tips
"
"CTRL-R CTRL-W   : pull word under the cursor into a command line or search
" CTRL-R CTRL-A   : pull whole word including punctuation
" CTRL-R -        : pull small register
" CTRL-R [0-9a-z] : pull named registers
" CTRL-R %        : pull file name (also #)
"
" substitue keeping case
" :S/from/to

" To close buffers : %bd|e#

" help for commands : <C-d>
