return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "catppuccin",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  heirline = {
    attributes = {
      mode = { bold = true },
    }
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        filter = function(bufnr)
          -- local bufname = vim.api.nvim_buf_get_name(bufnr)
          -- return string.match(bufname, '.*illumina.*') == nil
        end,
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      -- 'rust_analyzer',
    },
    config = {
      -- rust_analyzer = function()
      --   return {
      --     cmd = { "rustup", "run", "stable", "rust-analyzer" },
      --     filetypes = { "rust" },
      --     root_dir = require('lspconfig.util').root_pattern("Cargo.toml"),
      --   }
      -- end,
    }
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          -- "matchparen",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "tutor",
          "zipPlugin",
        },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    local my_group = vim.api.nvim_create_augroup('my_group', { clear = true })
    -- for quick execution of python files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'python',
      command = 'nnoremap <F5> <cmd>update <bar> !python %<CR>',
      group = my_group,
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'go',
      command = 'nnoremap <F5> <cmd>update <bar> !go run %<CR>',
      group = my_group,
    })

    -- User commands
    vim.api.nvim_create_user_command('DiffOrig', require('user.jobin.commands').diff_original, {})

    -- Work related
    require('user.jobin.work_stuff.macros')
  end,
}
