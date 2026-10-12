return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        matcher = {
          filename_bonus = true,
        },
        sources = {
          files = {
            exclude = {
              "bin",
              "obj",
              "*.dll",
            },
          },
        },
      },
    },
  },
}
