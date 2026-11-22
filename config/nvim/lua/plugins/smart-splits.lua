return {
  "smart-splits-nvim/smart-splits.nvim",
  version = "^3.0.0",
  lazy = false,
  dependencies = {
    "smart-splits-nvim/backend-kitty",
    "smart-splits-nvim/backend-ghostty",
  },
  opts = {
    mux = {
      backend = { "smart-splits-backend-kitty", "smart-splits-backend-ghostty" },
      warn_if_unusable = false,
    },
    move = { at_edge = "stop" },
  },
  keys = {
    { "<C-h>", function() require("smart-splits").move_cursor_left() end },
    { "<C-j>", function() require("smart-splits").move_cursor_down() end },
    { "<C-k>", function() require("smart-splits").move_cursor_up() end },
    { "<C-l>", function() require("smart-splits").move_cursor_right() end },
  },
}
