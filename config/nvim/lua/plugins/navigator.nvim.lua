return {
  "dynamotn/Navigator.nvim",
  lazy = false,
  config = function()
    require("Navigator").setup()
  end,
  cmd = {
    "NavigatorLeft",
    "NavigatorDown",
    "NavigatorUp",
    "NavigatorRight",
    "NavigatorPrevious",
  },
  keys = {
    { "<C-h>", "<cmd>NavigatorLeft<cr>" },
    { "<C-j>", "<cmd>NavigatorDown<cr>" },
    { "<C-k>", "<cmd>NavigatorUp<cr>" },
    { "<C-l>", "<cmd>NavigatorRight<cr>" },
    { "<C-\\>", "<cmd>NavigatorPrevious<cr>" },
  },
}
