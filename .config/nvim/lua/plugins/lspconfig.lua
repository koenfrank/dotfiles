return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        enabled = true,
      },
      servers = {
        omnisharp = {
          handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
            ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
            ["textDocument/references"] = require("omnisharp_extended").references_handler,
            ["textDocument/implemenation"] = require("omnisharp_extended").implementation_handler,
          },
          keys = {
            {
              "gd",
              function()
                require("omnisharp_extended").telescope_lsp_definitions({ jump_type = "vsplit" })
              end,
              desc = "Goto Definition",
            },
            {
              "gy",
              function()
                require("omnisharp_extended").telescope_lsp_type_definitions()
              end,
              desc = "Go to T[y]pe definition",
            },
            {
              "gr",
              function()
                require("omnisharp_extended").telescope_lsp_references()
              end,
              desc = "references",
            },
            {
              "gI",
              function()
                require("omnisharp_extended").telescope_lsp_implementation()
              end,
              desc = "Implementation",
            },
          },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
    },
  },
}
