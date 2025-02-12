return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.number = true
            vim.opt_local.relativenumber = true
          end
        }
      },
      filesystem = {
        hijack_netrw_behavior = "disabled",
        window = {
          mappings = {
            ["/"] = "noop"
          }
        }
      }
    })
  end,
  keys = {
    { "<leader>fV", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
  },
  -- init = function()
  --   -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
  --   -- because `cwd` is not set up properly.
  --   vim.api.nvim_create_autocmd("BufEnter", {

  --     group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
  --     desc = "Start Neo-tree with directory",
  --     once = true,
  --     callback = function()
  --       if package.loaded["neo-tree"] then
  --         return
  --       else
  --         local stats = vim.uv.fs_stat(vim.fn.argv(0))
  --         if stats and stats.type == "directory" then
  --           require("neo-tree")
  --         end
  --       end
  --     end,
  --   })
  -- end,
}
