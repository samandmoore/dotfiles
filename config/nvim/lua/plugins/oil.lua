return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    -- default_file_explorer = true,
    keymaps = {
      ["?"] = "actions.show_help",
    },
    view_options = {
      show_hidden = true,
    },
  },
  cmd = {
    "Oil",
  },
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "Open parent directory",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
