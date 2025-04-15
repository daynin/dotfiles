local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'navarasu/onedark.nvim',
  'catppuccin/nvim',
  'vim-test/vim-test',
  -- 'tpope/vim-fugitive',
  'christoomey/vim-tmux-navigator',
  'ziglang/zig.vim',
  'simrat39/rust-tools.nvim',
  'David-Kunz/gen.nvim',
  'sainnhe/everforest',
  'shaunsingh/nord.nvim',
  'pest-parser/pest.vim',
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  { "rcarriga/nvim-dap-ui",                     dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'prettier/vim-prettier',                    build = 'yarn install --immutable' },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',  -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
      'ibhagwan/fzf-lua',              -- optional
    },
    config = true
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {}
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      vim.o.termguicolors = true
      require('colorizer').setup()
      vim.cmd.colorscheme('nord')
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- A list of parser names, or 'all' (the five listed parsers should always be installed)
        ensure_installed = { 'javascript', 'typescript', 'lua', 'vim', 'query' },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      })

      vim.cmd(':TSUpdate')
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup {
        defaults = {
          layout_config = {
            preview_width = 0.55,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
          }
        }
      }

      telescope.load_extension('fzf')
    end
  },
  {
    'hoob3rt/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'nord',
          component_separators = { '', '' },
          section_separators = { '', '' },
          disabled_filetypes = {},
        },
      })
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          ---Line-comment toggle keymap
          line = '<Leader>cc',
          ---Block-comment toggle keymap
          block = '<Leader>bc',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = '<Leader>c',
          ---Block-comment keymap
          block = '<Leader>b',
        },
      })
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',             -- Required
      'williamboman/mason.nvim',           -- Optional
      'williamboman/mason-lspconfig.nvim', -- Optional

      -- Autocompletion
      'hrsh7th/nvim-cmp',         -- Required
      'hrsh7th/cmp-nvim-lsp',     -- Required
      'hrsh7th/cmp-buffer',       -- Optional
      'hrsh7th/cmp-path',         -- Optional
      'saadparwaiz1/cmp_luasnip', -- Optional
      'hrsh7th/cmp-nvim-lua',     -- Optional

      -- Snippets
      'L3MON4D3/LuaSnip',             -- Required
      'rafamadriz/friendly-snippets', -- Optional
    }
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup({
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
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


local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
  'eslint',
  'rust_analyzer',
})

lsp.nvim_workspace()
lsp.setup()

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
