require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua","go","javascript", "typescript" , "c" , "rust"},
  autotag = {
    enable = true,
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
