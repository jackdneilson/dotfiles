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
    { "<leader>t",  "", desc = "+test" },

    -- Run tests
    {
      "<leader>tt",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run File (Neotest)"
    },
    {
      "<leader>tT",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run(vim.uv.cwd())
      end,
      desc = "Run All Test Files (Neotest)"
    },
    {
      "<leader>tr",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run()
      end,
      desc = "Run Nearest (Neotest)"
    },
    {
      "<leader>tl",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run_last()
      end,
      desc = "Run Last (Neotest)"
    },

    -- Debug tests
    { "<leader>td", "", desc = "+debug-test" },
    {
      "<leader>tdt",
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
      "<leader>tdr",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug Nearest (Neotest)"
    },
    {
      "<leader>tdl",
      function()
        require("neotest").output_panel.clear()
        require("neotest").run.run_last({ strategy = "dap" })
      end,
      desc = "Debug Last (Neotest)"
    },

    { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary (Neotest)" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output (Neotest)" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle Output Panel (Neotest)" },
    { "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "Stop (Neotest)" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,                 desc = "Toggle Watch (Neotest)" },
  },
}
