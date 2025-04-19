vim.g.mapleader = " "

vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/lazy/lazy.nvim")

require("lazy").setup({
  -- Telescope
  { "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Mason for managing LSPs
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },

  -- Mason bridge for LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" },
      })
    end,
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").pyright.setup({})
    end,
  },

  -- 🔥 File explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    end,
  },

  -- 🧠 Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",    -- Connects nvim-cmp to LSP
      "hrsh7th/cmp-buffer",      -- Buffer completion
      "hrsh7th/cmp-path",        -- File paths
      "hrsh7th/cmp-cmdline",     -- Cmdline completion
      "L3MON4D3/LuaSnip",        -- Snippet engine
      "saadparwaiz1/cmp_luasnip" -- Snippet source for cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
})

-- Telescope shortcut for dotfiles
vim.keymap.set("n", "<leader>fc", function()
  require("telescope.builtin").find_files({ cwd = os.getenv("HOME") .. "/dotfiles", follow = true })
end, { desc = "Find dotfile" })

-- Line numbers
vim.opt.number = true         -- Show absolute line numbers







