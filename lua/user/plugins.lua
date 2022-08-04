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
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'natebosch/dartlang-snippets'
    use { 'neoclide/coc.nvim', branch = 'release'}
    use 'nvim-lualine/lualine.nvim'

end)
