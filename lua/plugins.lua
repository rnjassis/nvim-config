-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- File searching
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },

  -- Color scheme
  { "catppuccin/nvim", name = "catppuccin" },

  -- Tabs
  { "nvim-tree/nvim-web-devicons" },
  { "romgrk/barbar.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Tree
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Status line
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Indentation guides
  { "lukas-reineke/indent-blankline.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Color previews
  { "norcalli/nvim-colorizer.lua" },

  -- Undo tree
  { "mbbill/undotree" },

    -- Undo Tree
  { "mbbill/undotree" },

  -- LSP support
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/nvim-cmp" },
  { "onsails/lspkind.nvim" },
  { "ray-x/lsp_signature.nvim" },

  -- Harpoon
  { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Fast f/F/t/T search
  { "folke/flash.nvim" },

  -- Tmux integration (always loaded)
  { "christoomey/vim-tmux-navigator", lazy = false },

  -- Show Absolute and Relative numbers
  { "shrynx/line-numbers.nvim", opts = {}, }
})

