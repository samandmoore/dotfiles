return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        mason = false,
      },
      rubocop = {
        mason = false,
      },
    },
  },
}
