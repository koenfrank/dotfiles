return {
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    opts = {
      enabled = true,
      languages = {
        cs = {
          template = {
            -- overwrite default doxygen for csharp
            annotation_convention = "xmldoc",
          },
        },
      },
    },
  },
}
