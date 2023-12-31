-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use ('theprimeagen/harpoon')
    use ('tpope/vim-fugitive')
    use ('lervag/vimtex')
    use ('SirVer/ultisnips')
    use ('KeitaNakamura/tex-conceal.vim')
    use ('xiyaowong/transparent.nvim')
    use { 'ibhagwan/fzf-lua'}
    use { 'nvim-lua/plenary.nvim' }
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    vim.cmd('colorscheme rose-pine')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim', 
              run = function()
                pcall(vim.cmd, 'MasonUpdate')
              end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
    }
}
end)

