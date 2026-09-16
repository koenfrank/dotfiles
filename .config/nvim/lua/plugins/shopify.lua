return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "liquid",
        "html",
        "css",
        "javascript",
      },
    },
  },
  {
    "tpope/vim-liquid",
    ft = "liquid",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        shopify_theme_ls = {
          cmd = { "shopify", "theme", "language-server" },
          filetypes = { "liquid" },
        },
      },
    },
  },
}
