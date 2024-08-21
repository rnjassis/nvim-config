-- reference https://github.com/wbthomason/packer.nvim
-- :PackerSync

local fn = vim.fn

-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- "Requiring a nonexistent module or a module which contains syntax errors aborts the currently executing script.
-- pcall() may be used to prevent errors."
local ok, packer = pcall(require, "packer")
if not ok then
	return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Plugins
return packer.startup(function(use)
	-- File searching
	use { "nvim-lua/plenary.nvim"}
	use { "nvim-telescope/telescope.nvim"}
	
	-- Color scheme
	-- use { "ellisonleao/gruvbox.nvim" }
	use { "catppuccin/nvim", as = "catppuccin" }

	-- Tabs
	use { "nvim-tree/nvim-web-devicons" }
	use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

	-- Tree
	use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }

	-- Statusbar
	use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }

	-- Identation
	use { "lukas-reineke/indent-blankline.nvim" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", use = ":TSUpdate"}

    -- Recognize colors
    use { "norcalli/nvim-colorizer.lua" }

	-- LSP support
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	use { "neovim/nvim-lspconfig" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { 'L3MON4D3/LuaSnip' }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/nvim-cmp" }
    use { "onsails/lspkind.nvim" }
    use { "ray-x/lsp_signature.nvim" }

    -- Harpoon
    use { "ThePrimeagen/harpoon",branch = "harpoon2",requires = { {"nvim-lua/plenary.nvim"} } }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
    		require("packer").sync()
	end
end)
