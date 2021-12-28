local colorscheme = "tender"

-- vim.g.gruvbox_flat_style = 'hard'
-- local colorscheme = "gruvbox-flat"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
