-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.vue" }, -- укажите нужные расширения
  callback = function()
    local prettier_config_found = vim.fn.glob(".prettierrc*") ~= "" or vim.fn.glob("prettier.config.*") ~= ""
    if prettier_config_found then
      vim.cmd("lua vim.lsp.buf.format()")
    end
  end,
})
