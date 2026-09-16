return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          local ok, chat = pcall(require, "CopilotChat")
          if ok then
            chat.save(os.date("%Y-%m-%d_%H-%M-%S"))
          end
        end,
      })
    end,
  },
}
