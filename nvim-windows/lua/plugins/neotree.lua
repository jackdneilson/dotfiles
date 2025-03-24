return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
      source_selector = {
        winbar = true
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd [[ setlocal relativenumber ]]
          end
        }
      },
      buffers = {
        bind_to_cwd = false,
      },
      filesystem = {
        bind_to_cwd = true,
        cwd_target = {
          sidebar = "none",
        },
        window = {
          mappings = {
            ["/"] = "noop",
            ["v"] = "vsplit_nofocus"
          }
        },
        commands = {
          vsplit_nofocus = function(state)
            require("neo-tree.sources.filesystem.commands").open_vsplit(state)
            vim.schedule(function()
              vim.cmd([[Neotree focus]])
            end)
          end
        }
      }
    })
  end,
  keys = {
    { "<leader>fv", "<cmd>Neotree toggle<CR>", desc = "Toggle Neotree Files" },
  },
}
