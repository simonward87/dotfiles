local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end


local prettier = function ()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
    stdin = true
  }
end

formatter.setup {
  filetype = {
    javascript = {
      prettier
    },
    typescript = {
      prettier
    },
    javascriptreact = {
      prettier
    },
    typescriptreact = {
      prettier
    },
  }
}

-- formatter.setup {
--   filetype = {
--     javascript = {
--       -- prettier
--       function ()
--         return {
--           exe = "prettier",
--           args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
--           stdin = true
--         }
--       end
--     }
--   }
-- }
