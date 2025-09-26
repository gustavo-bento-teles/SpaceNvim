-- Customize Treesitter
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "c_sharp",
      "c",
      "cpp",
    },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
  },
}
