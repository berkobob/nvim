local ok, packer = pcall(require, 'packer')
if not ok then
    print 'Packer no OK'
    return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    -- use "ellisonleao/gruvbox.nvim"
    use 'folke/tokyonight.nvim'
    use {
	    'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'natebosch/dartlang-snippets'
    use 'nvim-lualine/lualine.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*",}
    use 'kyazdani42/nvim-tree.lua'
    use 'lewis6991/gitsigns.nvim'
    use { 'nvim-lua/plenary.nvim' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'kyazdani42/nvim-web-devicons' }
    use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
    use {"akinsho/toggleterm.nvim", tag = 'v2.*',}
})

end)
