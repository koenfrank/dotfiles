return {
  {
    "mfussenegger/nvim-dap",
    cond = function()
      return vim.fn.has("mac") == 1
    end,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    ft = { "cs" }, -- lazy-load for C# files
    config = function()
      local dap = require("dap")

      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "○", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
      )
      vim.fn.sign_define("DapStopped", { text = "→", texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "" })
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "◆", texthl = "DiagnosticSignHint", linehl = "", numhl = "" }
      )
      vim.fn.sign_define("DapLogPoint", { text = "L", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })

      -- locate netcoredbg: prefer ~/.local/share/netcoredbg/netcoredbg, fallback to PATH
      local default_path = vim.fn.expand("~/.local/share/netcoredbg/netcoredbg")
      local netcoredbg = default_path
      if vim.fn.executable(netcoredbg) == 0 then
        local found = vim.fn.exepath("netcoredbg")
        if found ~= "" then
          netcoredbg = found
        end
      end

      if vim.fn.executable(netcoredbg) == 0 then
        vim.notify(
          "netcoredbg not found. Install it to " .. default_path .. " or put 'netcoredbg' in your $PATH",
          vim.log.levels.ERROR
        )
        return
      end

      dap.adapters.coreclr = {
        type = "executable",
        command = netcoredbg,
        args = { "--interpreter=vscode" },
      }

      local function find_default_dll()
        local cwd = vim.fn.getcwd()
        local tfms = { "net10.0", "net8.0", "net7.0", "net6.0", "net5.0" }
        for _, tfm in ipairs(tfms) do
          local pattern = cwd .. "/bin/Debug/" .. tfm .. "/*.dll"
          local matches = vim.fn.glob(pattern, false, true)
          if matches and #matches > 0 then
            return matches[1]
          end
        end
        -- fallback: any dll under bin/Debug
        local any = vim.fn.glob(cwd .. "/bin/Debug/**/*.dll", false, true)
        if any and #any > 0 then
          return any[1]
        end
        return nil
      end

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch .NET (dll)",
          request = "launch",
          program = function()
            local cwd = vim.fn.getcwd()
            local default = find_default_dll() or (cwd .. "/bin/Debug/net10.0/")
            return vim.fn.input("Path to dll: ", default, "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
          console = "integratedTerminal",
        },
        {
          type = "coreclr",
          name = "Attach to Process",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }

      -- Optional UI setup: will be used if rcarriga/nvim-dap-ui is installed
      pcall(function()
        local dapui = require("dapui")
        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end)
    end,
  },
}
