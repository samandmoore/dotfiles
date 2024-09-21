return {
  {
    "stevearc/oil.nvim",
    opts = {
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
  },
}
