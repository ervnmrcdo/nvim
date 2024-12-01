-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ThePrimeagen/vim-be-good',
    version = '*',
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {--[[ things you want to change go here]]
      direction = 'float',
    },
    -- keys = {
    -- { '<leader>td', '<cmd>ToggleTerm size=40 dir=~/Desktop direction=horizontal<cr>', desc = 'Open a horizontal terminal at the Desktop directory' },
    -- },
    config = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
          border = 'double',
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd 'startinsert!'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd 'startinsert!'
        end,
      }

      local term = Terminal:new {
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
          border = 'double',
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd 'startinsert!'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd 'startinsert!'
        end,
      }

      function _lazygit_toggle()
        lazygit:toggle()
      end

      function _term_toggle()
        term:toggle()
      end

      vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua _term_toggle()<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = {
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
      window = {
        position = 'right', -- Set the position to the right side
        width = 30, -- You can adjust the width as needed
      },
    },
  },
  { 'norcalli/nvim-colorizer.lua' },
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = false })
      local event = 'BufWritePre' -- or "BufWritePost"
      local async = event == 'BufWritePost'
    end,
  },
  {
    'MunifTanjim/prettier.nvim',
    bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
    filetypes = {
      'css',
      'graphql',
      'html',
      'javascript',
      'javascriptreact',
      'json',
      'less',
      'markdown',
      'scss',
      'typescript',
      'typescriptreact',
      'yaml',
      'python',
      'lua',
    },
  },
  {
    'rhysd/vim-clang-format',
    config = function()
      vim.g['clang_format#style_options'] = {
        ColumnLimit = 120, -- Change this to your desired limit
        IndentWidth = 4, -- Customize other options as needed
        AllowShortIfStatementsOnASingleLine = 'false',
      }
    end,
  },
}
