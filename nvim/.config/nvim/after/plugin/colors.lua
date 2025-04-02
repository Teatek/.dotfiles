-- Colorscheme based on background
-- Avoid background being equals to nil
vim.schedule(function()
  if vim.o.background == 'light' then
    vim.cmd[[colorscheme dayfox]]
    -- Make sure we changed the colorscheme
    vim.cmd[[colorscheme dayfox]]
  else
    vim.cmd[[colorscheme nightfox]]
  end
end)
