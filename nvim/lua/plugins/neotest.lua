return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    "nvim-neotest/neotest-jest"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        })
      }
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "neotest-output-panel",
      callback = function()
        vim.cmd("norm G")
      end
    })
  end,
  keys = {
    { "<leader>T",  "", desc = "+test" },

    -- Run tests
    {
      "<leader>Tt",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run File (Neotest)"
    },
    {
      "<leader>TT",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run(vim.uv.cwd())
      end,
      desc = "Run All Test Files (Neotest)"
    },
    {
      "<leader>Tr",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run()
      end,
      desc = "Run Nearest (Neotest)"
    },
    {
      "<leader>Tl",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run_last()
      end,
      desc = "Run Last (Neotest)"
    },

    -- Debug tests
    { "<leader>Td", "", desc = "+debug-test" },
    {
      "<leader>Tdt",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run({
          vim.fn.expand("%"),
          strategy = "dap"
        })
      end,
      desc = "Debug File (Neotest)"
    },
    {
      "<leader>Tdr",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug Nearest (Neotest)"
    },
    {
      "<leader>Tdl",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run_last({ strategy = "dap" })
      end,
      desc = "Debug Last (Neotest)"
    },

    { "<leader>Ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary (Neotest)" },
    { "<leader>To", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output (Neotest)" },
    { "<leader>TO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle Output Panel (Neotest)" },
    { "<leader>TS", function() require("neotest").run.stop() end,                                       desc = "Stop (Neotest)" },
    { "<leader>Tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,                 desc = "Toggle Watch (Neotest)" },
  },
}
