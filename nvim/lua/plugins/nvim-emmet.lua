return {
  "olrtg/nvim-emmet",
  keys = {
    { "<leader>xe", function() require("nvim-emmet").wrap_with_abbreviation() end, mode = { "n", "v" }, desc = "Wrap with abbreviation (emmet)" }
  }
}
