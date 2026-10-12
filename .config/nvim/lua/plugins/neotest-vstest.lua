return {
  {
    "nvim-neotest/neotest",
    optional = true,
    opts = {
      adapters = {
        ["neotest-vstest"] = {
          build_opts = {
            additional_args = { "-property:TargetFramework=net10.0" },
          },
          dap_settings = {
            type = "coreclr",
          },
        },
      },
    },
  },
}
