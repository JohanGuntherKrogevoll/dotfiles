lvim.plugins = {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestions = {
  --         enabled = true,
  --         auto_trigger = true,
  --       },
  --       panel = {
  --         enabled = true
  --       },
  --       filetypes = {
  --         bash = true,
  --         go = true,
  --         javascript = true,
  --         markdown = true,
  --         rust = true,
  --         terraform = true,
  --         typescript = true,
  --         shell = true,
  --         yaml = true,
  --       }
  --     })
  --   end,
  -- },

  { 'mg979/vim-visual-multi' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },

  { 'jose-elias-alvarez/typescript.nvim' },

  { 'lunarvim/lunar.nvim' },
  { "morhetz/gruvbox" },
  { "sainnhe/gruvbox-material" },
  { "sainnhe/sonokai" },
  { "sainnhe/edge" },
  { "lunarvim/horizon.nvim" },
  { "tomasr/molokai" },
  { "ayu-theme/ayu-vim" },

  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },

  { "prettier/vim-prettier" },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },

  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-surround" },
  { "felipec/vim-sanegx",            event = "BufRead" },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "tpope/vim-repeat" },

  {
    "ThePrimeagen/harpoon",
    -- branch = 'harpoon2',
    -- dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },

  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
  },

  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
  },

  {
    'nvim-telescope/telescope-media-files.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
  },

  {
    'AckslD/nvim-trevJ.lua',
    config = 'require("trevj").setup()',
    init = function()
      vim.keymap.set('n', '<leader>j', function()
        require('trevj').format_at_cursor()
      end)
    end,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Dropbox/DropsyncFiles/Obsidian Vault",
        },
        {
          name = "PocketKube",
          path = "~/dev/perret/pocketkube/pocketkube-obsidian-vault",
        },
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },

  {
    'wakatime/vim-wakatime',
    lazy = false,
  },

  -- DB plugins
  { "tpope/vim-dadbod" },
  { "kristijanhusak/vim-dadbod-ui" },
  { "kristijanhusak/vim-dadbod-completion" },

  -- Focus plugins
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 1,
      }
    },
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },


  -- Using gen.nvim with Ollama
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "mistral",      -- The default model to use.
      display_mode = "float", -- The display mode. Can be "float" or "split".
      show_prompt = false,    -- Shows the Prompt submitted to Ollama.
      show_model = false,     -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false,  -- Never closes the window automatically.
      init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
      -- Function to initialize Ollama
      command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a lua function returning a command string, with options as the input parameter.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      list_models = '<omitted lua function>', -- Retrieves a list of model names
      debug = false                           -- Prints errors and the command which is run.
    }
  },
  { "tpope/vim-surround" },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'      -- optional
    }
  },
  { 'dmmulroy/ts-error-translator.nvim' },
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    -- init = function()
    --   -- vim.keymap.set('n', '<leader>j', function()
    --   --   require('trevj').format_at_cursor()
    --   -- end)
    --   vim.api.nvim_set_keymap('n', '<leader>Ed', '<cmd>lua BetterTsErrors.toggle()<CR>',
    --     { noremap = true, silent = true, desc = 'Show Better TS Error' })

    --   vim.api.nvim_set_keymap('n', '<leader>Ex', '<cmd>lua BetterTsErrors.goToDefinition()<CR>',
    --     { noremap = true, silent = true, desc = 'Go to Error Definition' })
    -- end,
    -- opts = {
    --   defaults = {
    --     ["<leader>E"] = { name = "+TS Error Translator" },
    --   }
    -- },
    config = {
      keymaps = {
        toggle = '<leader>Ed',          -- default '<leader>dd'
        go_to_definition = '<leader>Ex' -- default '<leader>dx'
      }
    }
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "Equilibris/nx.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts         = {
      -- See below for config options
      nx_cmd_root = "npx nx",
    },
    -- Plugin will load when you use these keys
    keys         = {
      { "<leader>nx", "<cmd>Telescope nx actions<CR>", desc = "nx actions" }
    },
  },
}

-- table.insert(lvim.plugins, {
--   "zbirenbaum/copilot-cmp",
--   event = "InsertEnter",
--   dependencies = { "zbirenbaum/copilot.lua" },
--   config = function()
--     local ok, cmp = pcall(require, "copilot_cmp")
--     if ok then cmp.setup({}) end
--   end,
-- })

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "media_files")
end
