return {
  "backdround/global-note.nvim",
  config = function()
    require("global-note").setup()
  end,
  keys = {
    {
      "<leader>n",
      function()
        require("global-note").toggle_note()
      end,
      desc = "Toggle global note"
    }
  }
}
