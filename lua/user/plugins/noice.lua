---@type LazySpec
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      position = { row = "10%", col = "50%" },
      size = { width = 60 },
      throttle = 50,
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { pattern = "^/", icon = " ", lang = "regex" },
        search_up   = { pattern = "^%?", icon = " ", lang = "regex" },
      },
    },
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },

    presets = {
      command_palette = true,
    },
  },
  dependencies = { "MunifTanjim/nui.nvim" },
}
