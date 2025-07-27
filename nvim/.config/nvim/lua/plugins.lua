local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Colorschemes
  { 'navarasu/onedark.nvim', lazy = true },
  { 'catppuccin/nvim', lazy = true },
  { 'sainnhe/everforest', lazy = true },
  { 'shaunsingh/nord.nvim', priority = 1000 }, -- Load early for colorscheme
  
  -- Language support (lazy loaded by filetype)
  { 'vim-test/vim-test', cmd = { 'TestFile', 'TestNearest', 'TestSuite', 'TestLast' } },
  { 'christoomey/vim-tmux-navigator', keys = { '<C-h>', '<C-j>', '<C-k>', '<C-l>' } },
  { 'ziglang/zig.vim', ft = 'zig' },
  { 'simrat39/rust-tools.nvim', ft = 'rust' },
  { 'David-Kunz/gen.nvim', cmd = 'Gen' },
  { 'pest-parser/pest.vim', ft = 'pest' },
  
  -- Core LSP and completion
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  
  -- Debug adapter (lazy loaded)
  { 'mfussenegger/nvim-dap', keys = { '<Leader>dc', '<Leader>dn', '<Leader>di', '<Leader>do', '<Leader>db', '<Leader>dB', '<Leader>dr', '<Leader>du' } },
  { 'theHamsta/nvim-dap-virtual-text', dependencies = 'mfussenegger/nvim-dap' },
  {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = {
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = { auto_show = true },
        documentation = { auto_show = true, auto_show_delay_ms = 500 }, -- Increased delay for performance
      },
    },
    opts_extend = { "sources.default" }
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format({ async = true, lsp_fallback = true })
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        json = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        markdown = { 'prettier' },
      },

      formatters = {
        prettier = {
          command = 'prettier',
          args = { '--stdin-filepath', '$FILENAME' },
          stdin = true,
        },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = 'Neogit',
    keys = { '<Leader>gg' },
    config = true
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufReadPost',
    opts = {}
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPost',
    config = function()
      require('colorizer').setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'javascript', 'typescript', 'lua', 'vim', 'query', 'rust', 'zig' },
        sync_install = false,
        auto_install = false, -- Disabled for performance
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = { enable = false }, -- Disabled for performance
        indent = { enable = false }, -- Disabled for performance
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    cmd = 'Telescope',
    keys = { '<Leader>b', '<C-p>', '<C-f>', 'gd', 'gr' },
    config = function()
      local telescope = require('telescope')
      telescope.setup {
        defaults = {
          layout_config = {
            preview_width = 0.55,
          },
          file_ignore_patterns = { "node_modules", ".git/" },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          }
        }
      }

      telescope.load_extension('fzf')
    end
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.statusline').setup({
        use_icons = true,
        set_vim_settings = false,
      })
    end
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    'numToStr/Comment.nvim',
    keys = { '<Leader>cc', '<Leader>bc', '<Leader>c', '<Leader>b' },
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<Leader>cc',
          block = '<Leader>bc',
        },
        opleader = {
          line = '<Leader>c',
          block = '<Leader>b',
        },
      })
    end
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('oil').setup({
        default_file_explorer = true,
        columns = { 'icon' },
        view_options = {
          show_hidden = true,
        },
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
        },
        keymaps = {
          ['<C-n>'] = 'actions.close',
          ['q'] = 'actions.close',
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-jest',
      'nvim-neotest/nvim-nio',
    },
    cmd = { 'Neotest' },
    keys = { '<Leader>t', '<Leader>tn' },
    config = function()
      require('neotest').setup({
        icons = {
          passed = '●',
          running = '●',
          failed = '●',
        },
        output = {
          enabled = true,
          open_on_run = 'enter'
        },
        output_panel = {
          enabled = true,
          open = 'botright split | resize 30'
        },
        adapters = {
          require('neotest-jest')({
            env = { TZ = 'UTC' },
            jestConfigFile = 'tool/jest.config.ts',
            jestCommand = 'yarn jest'
          }),
        }
      })
    end
  },
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

local dap = require('dap')

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
    args = { '--port', '${port}' },
  }
}

dap.configurations.rust = {
  {
    name = "Debug executable",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    showDisassembly = "never",
  },
}

local dapui = require('dapui')

dapui.setup({
  -- You can configure layouts, icons, etc. here.
  -- Example:
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches"
      },
      size = 40,
      position = "left"
    },
    {
      elements = {
        "repl",
        "console"
      },
      size = 10,
      position = "bottom"
    }
  },
})

-- Optionally open/close dap-ui automatically when starting/ending debug sessions
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("nvim-dap-virtual-text").setup()



require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'tsserver' },
})
local lspconfig = require('lspconfig')
local capabilities = require('blink.cmp').get_lsp_capabilities()

require('mason-lspconfig').setup({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end
})
