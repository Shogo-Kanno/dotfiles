vim.api.nvim_exec([[
  autocmd TermOpen * lua vim.wo.relativenumber = false
  autocmd TermOpen * lua vim.wo.number = false
]], false)
