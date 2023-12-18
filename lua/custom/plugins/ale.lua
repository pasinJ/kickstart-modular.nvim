return {
  'dense-analysis/ale',
  config = function()
    vim.g.ale_linters_explicit = 1
    vim.g.ale_fix_on_save = 1
    vim.g.ale_lint_on_enter = 0
    vim.g.ale_lint_on_insert_leave = 0
    vim.g.ale_lint_on_filetype_changed = 0
    vim.g.ale_lint_on_text_changed = 'never'
    vim.g.ale_fixers = {
      ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
      javascript = { 'prettier', 'eslint' },
      javascriptreact = { 'prettier', 'eslint' },
      typescript = { 'prettier', 'eslint' },
      typescriptreact = { 'prettier', 'eslint' },
      html = { 'prettier', 'eslint' },
      css = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      dockerfile = { 'hadolint' },
      rust = 'rustfmt',
      lua = 'stylua',
    }
  end,
}
