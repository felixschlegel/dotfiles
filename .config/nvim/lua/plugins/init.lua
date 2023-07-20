return require('packer').startup(function(use)
    use 'neovim/nvim-lspconfig'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'ms-jpq/coq_nvim', run = 'python3 -m coq deps' }
    use 'ms-jpq/coq.artifacts'
    use 'ms-jpq/coq.thirdparty'
end)
