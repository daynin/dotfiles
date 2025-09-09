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
  { 'shaunsingh/nord.nvim',           priority = 1 }, -- Load early for colorscheme

  -- Language support (lazy loaded by filetype)
  { 'vim-test/vim-test',              cmd = { 'TestFile', 'TestNearest', 'TestSuite', 'TestLast' } },
  { 'christoomey/vim-tmux-navigator', keys = { '<C-h>', '<C-j>', '<C-k>', '<C-l>' } },
  { 'ziglang/zig.vim',                ft = 'zig' },
  { 'simrat39/rust-tools.nvim',       ft = 'rust' },
  { 'David-Kunz/gen.nvim',            cmd = 'Gen' },
  { 'pest-parser/pest.vim',           ft = 'pest' },

  -- Core LSP and completion
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
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
    config = function()
      require('conform').setup({
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
            command = function(self, ctx)
              -- Use yarn prettier in workspace projects
              local util = require('conform.util')
              if util.root_file({ 'yarn.lock', '.yarnrc.yml' })(self, ctx) then
                return 'yarn'
              end
              return 'prettier'
            end,
            args = function(self, ctx)
              local util = require('conform.util')
              if util.root_file({ 'yarn.lock', '.yarnrc.yml' })(self, ctx) then
                return { 'prettier', '--stdin-filepath', '$FILENAME' }
              end
              return { '--stdin-filepath', '$FILENAME' }
            end,
            stdin = true,
            cwd = require('conform.util').root_file({
              '.prettierrc',
              '.prettierrc.json',
              '.prettierrc.yml',
              '.prettierrc.yaml',
              '.prettierrc.js',
              'prettier.config.js',
              'package.json',
            }),
          },
        },
      })
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
    lazy = false,
    priority = 1000,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'javascript', 'typescript', 'tsx', 'lua', 'vim', 'vimdoc', 'query', 'rust', 'zig', 'html', 'css', 'json', 'markdown', 'markdown_inline' },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = { enable = true },
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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
      })
    end
  },
  {
    'echasnovski/mini.pairs',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.pairs').setup()
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

require('mason').setup()
local lspconfig = require('lspconfig')
local capabilities = require('blink.cmp').get_lsp_capabilities()

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'ts_ls' },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end
  }
})
