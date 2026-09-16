return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      codelens = {
        enabled = true,
      },
      servers = {
        vtsls = {
          settings = {
            typescript = {
              referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
              },
            },
            javascript = {
              referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
              },
            },
          },
        },
      },
    },
  },
}
