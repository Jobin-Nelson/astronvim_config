local rust = {}
if vim.fn.executable('cargo') == 1 then
  rust = { import = "astrocommunity.pack.rust" }
end

local go = {}
if vim.fn.executable('go') == 1 then
  go = { import = "astrocommunity.pack.go" }
end

return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.codeium-vim" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript" },
  rust,
  go,
}
