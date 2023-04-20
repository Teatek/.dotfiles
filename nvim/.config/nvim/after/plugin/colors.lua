local hourNow = tonumber(os.date("%H"))

require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'auto'
    -- ... your lualine config
  }
}

-- set colorscheme by default depending on time of day
-- best way since we can't have the background color of the terminal
if hourNow > 8 and hourNow < 18 then
  vim.cmd[[colorscheme dayfox]]
else
  vim.cmd[[colorscheme nightfox]]
end
