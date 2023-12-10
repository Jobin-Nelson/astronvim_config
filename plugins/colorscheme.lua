return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    transparent_background = true,
    dim_inactive = {
      enabled = false,
      shade = 'dark',
      percentage = 0.15,
    },
    integrations = {
      nvimtree = false,
      ts_rainbow = false,
      aerial = true,
      dap = { enabled = true, enable_ui = true },
      mason = true,
      neotree = true,
      notify = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      which_key = true,
    },
  },
}
