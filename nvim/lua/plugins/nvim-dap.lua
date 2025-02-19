return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      ui.setup()

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
    keys = {
      { "<F5>",       function() require('dap').continue() end,                                                    desc = "Continue" },
      { "<F10>",      function() require('dap').step_over() end,                                                   desc = "Step over" },
      { "<F11>",      function() require('dap').step_into() end,                                                   desc = "Step into" },
      { "<F12>",      function() require('dap').step_out() end,                                                    desc = "Step out" },
      { "<leader>b",  function() require("dap").toggle_breakpoint() end,                                           desc = "Toggle breakpoint" },
      { "<leader>B",  function() require("dap").set_breakpoint() end,                                              desc = "Set breakpoint" },
      { "<leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Set log point" },
      { "<leader>dr", function() require("dap").repl.open() end,                                                   desc = "Open REPL" },
      { "<leader>dl", function() require("dap").run_last() end,                                                    desc = "Run last" },
    }
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function()
      require("mason-nvim-dap").setup({
        automatic_installation = true,
        ensure_installed = {
          "js",
          "python"
        },
        handlers = {
          js = function(config)
            local dap = require("dap")
            local location = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

            dap.adapters["pwa-node"] = {
              type = "server",
              host = "localhost",
              port = "${port}",
              executable = {
                command = "node",
                args = { location, "${port}" }
              }
            }

            dap.configurations.javascript = {
              {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}"
              }
            }

            require("mason-nvim-dap").default_setup(config)
          end,

          python = function(config)
            local dap = require("dap")

            dap.adapters["python"] = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
              args = { "-m", "debugpy.adapter" },
              options = {
                source_filetype = "python"
              }
            }

            -- dap.configurations.python = {
            --   {
            --     type = "python",
            --     request = "launch",
            --     name = "Launch file",
            --     program = "${file}",
            --     pythonPath = function()
            --       local cwd = vim.fn.getcwd()
            --       if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            --         return cwd .. '/venv/bin/python'
            --       elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            --         return cwd .. '/.venv/bin/python'
            --       else
            --         return '/usr/bin/python'
            --       end
            --     end,
            --   }
            -- }

            require("mason-nvim-dap").default_setup(config)
          end
        }
      })
    end,
  }
}
