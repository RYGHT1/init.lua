return {
  'Exafunction/codeium.vim',
  config = function ()
    vim.keymap.set('n', '<c-/>', function() return vim.fn['codeium#Chat']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-g>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-h>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
}
