return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    -- default_file_explorer = true,
    keymaps = {
      ["?"] = "actions.show_help",
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
