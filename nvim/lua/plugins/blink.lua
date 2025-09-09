return {
  "Saghen/blink.cmp",
  opts = function(_, opts)
    opts.sources.default = { "lsp", "buffer", "path", "lazydev" }
    opts.sources.providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    }
  end,
}
