---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,  -- corrigi o typo wacther -> watcher
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = { ".." },
          },
          window = {
            height = 17,
            width = 15,
            position = "bottom",
          },
        }
      })
    end,
  },
}
