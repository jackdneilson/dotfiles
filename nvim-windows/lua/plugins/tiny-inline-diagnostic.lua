return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup({
      preset = "classic",
      options = {
        show_source = false,
        show_all_diags_on_cursorline = true
      }
    })
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false
    })
  end
}
