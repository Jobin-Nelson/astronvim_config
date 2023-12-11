return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User AstroFile",
    opts = { mode = "cursor", max_lines = 3 },
  },
  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    cmd = 'TSPlaygroundToggle',
  }
}
