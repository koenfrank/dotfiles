return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return tool ~= "csharpier"
      end, opts.ensure_installed or {})
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft.cs = vim.tbl_filter(function(formatter)
        return formatter ~= "csharpier"
      end, opts.formatters_by_ft.cs or {})
    end,
  },
}
