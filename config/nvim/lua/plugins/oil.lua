return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    -- default_file_explorer = true,
    keymaps = {
      ["?"] = "actions.show_help",
      -- disable keymaps that clash with ctrl+{h,j,k,l} for split navigation
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      -- add custom map for refresh since C-l is taken
      ["<A-r>"] = "actions.refresh",
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
