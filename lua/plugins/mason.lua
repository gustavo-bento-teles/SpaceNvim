-- Customize Mason
---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- language servers
        "lua-language-server",
        "pyright",
        "omnisharp",

        -- formatters
        "stylua",

        -- debuggers
        "debugpy",

        -- outros pacotes
        "tree-sitter-cli",
      },
    },
  },
}