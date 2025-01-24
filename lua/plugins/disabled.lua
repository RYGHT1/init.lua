local function disable(url)
  return { url, enabled = false }
end

return {
  disable("nvim-neo-tree/neo-tree.nvim"),
  disable("echasnovski/mini.pairs"),
}
