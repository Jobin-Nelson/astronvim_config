return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'org' },
    },
    ensure_installed = {
      'rust',
      'python',
      'bash',
      'markdown',
      'markdown_inline',
      'json',
      'yaml',
      'lua',
      'toml',
      'make',
      'html',
      'css',
      'javascript',
      'typescript',
      'tsx',
      'vim',
      'commonlisp',
      'org',
      'query'
    },
  },
}
