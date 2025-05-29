if os.getenv("TERM") == "xterm-kitty" then
  return {
    "knubie/vim-kitty-navigator",
    build = "cp ./*.py ~/.config/kitty/",
    lazy = false,
    cmd = {
      "KittyNavigateLeft",
      "KittyNavigateDown",
      "KittyNavigateUp",
      "KittyNavigateRight",
    },
    keys = {
      { "<C-h>", "<cmd>KittyNavigateLeft<cr>" },
      { "<C-j>", "<cmd>KittyNavigateDown<cr>" },
      { "<C-k>", "<cmd>KittyNavigateUp<cr>" },
      { "<C-l>", "<cmd>KittyNavigateRight<cr>" },
    },
  }
else
  return {}
end
